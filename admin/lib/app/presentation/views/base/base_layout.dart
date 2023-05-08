// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously, annotate_overrides

import 'package:admin/app/presentation/views/base/components/custom_pane_item_header.dart';
import 'package:admin/app/presentation/views/categorias/category_view.dart';
import 'package:admin/app/presentation/views/client/client_view.dart';
import 'package:admin/app/presentation/views/product/product_view.dart';
import 'package:admin/app/utils/shared_prefernces/shared_pref.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:window_manager/window_manager.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> with WindowListener {
  int currentIndex = 0;

  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        size: NavigationPaneSize(
            openMaxWidth: MediaQuery.of(context).size.width * 0.18),
        selected: currentIndex,
        onChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        header: SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/logo/logo.png')),
                  borderRadius: BorderRadius.circular(8)),
              margin: const EdgeInsets.only(
                left: 1.5,
                bottom: 10,
                right: 10,
                top: 10,
              ),
            )),
        items: [
          /*==============================================
            HOME
          ===============================================*/
          CutsomPaneItemHeader.customPaneItem(title: 'Home'),
          PaneItem(
            selectedTileColor:
                ButtonState.all(const Color(0xff303742).withOpacity(0.5)),
            icon: const Icon(FluentIcons.chart_series),
            title: Text(
              'Dashboard',
              style: GoogleFonts.montserrat(
                  fontWeight: currentIndex == 0 ? FontWeight.w500 : null),
            ),
            body: SizedBox.shrink(
              child: Container(color: Colors.white),
            ),
          ),
          PaneItemSeparator(color: Colors.grey[140]),
          /*==============================================
            LOCAÇÕES
          ===============================================*/
          CutsomPaneItemHeader.customPaneItem(title: 'Locações'),
          /*==============================================
            Orçamentos
          ===============================================*/
          PaneItem(
            selectedTileColor:
                ButtonState.all(const Color(0xff303742).withOpacity(0.5)),
            icon: const Icon(FluentIcons.money),
            title: Text(
              'Orçamentos',
              style: GoogleFonts.montserrat(
                  fontWeight: currentIndex == 1 ? FontWeight.w500 : null),
            ),
            body: SizedBox.shrink(
              child: Container(color: Colors.red),
            ),
          ),
          /*==============================================
            Contratos
          ===============================================*/
          PaneItem(
            selectedTileColor:
                ButtonState.all(const Color(0xff303742).withOpacity(0.5)),
            icon: const Icon(FluentIcons.invoice),
            title: Text(
              'Contratos',
              style: GoogleFonts.montserrat(
                  fontWeight: currentIndex == 2 ? FontWeight.w500 : null),
            ),
            body: SizedBox.shrink(
              child: Container(color: Colors.yellow),
            ),
          ),
          PaneItemSeparator(color: Colors.grey[140]),
          /*==============================================
            CADASTROS
          ===============================================*/
          CutsomPaneItemHeader.customPaneItem(title: 'Cadastros'),
          /*==============================================
            Clientes
          ===============================================*/
          PaneItem(
            selectedTileColor:
                ButtonState.all(const Color(0xff303742).withOpacity(0.5)),
            icon: const Icon(FluentIcons.people),
            title: Text(
              'Clientes',
              style: GoogleFonts.montserrat(
                  fontWeight: currentIndex == 3 ? FontWeight.w500 : null),
            ),
            body: const SizedBox.shrink(
              child: ClientView(),
            ),
          ),
          /*==============================================
            Usuarios
          ===============================================*/
          PaneItem(
            selectedTileColor:
                ButtonState.all(const Color(0xff303742).withOpacity(0.5)),
            icon: const Icon(FluentIcons.user_window),
            title: Text(
              'Usuarios',
              style: GoogleFonts.montserrat(
                  fontWeight: currentIndex == 4 ? FontWeight.w500 : null),
            ),
            body: SizedBox.shrink(
              child: Container(color: Colors.purple),
            ),
          ),
          /*==============================================
            Produtos
          ===============================================*/
         /* PaneItemExpander(
            trailing: Icon(FluentIcons.chevron_down, size: 10, color: Colors.grey[10],),
            icon: const Icon(FluentIcons.product_catalog),
            selectedTileColor:
                ButtonState.all(const Color(0xff303742).withOpacity(0.5)),
            title: Text(
              'Produtos',
              style: GoogleFonts.montserrat(
                  fontWeight: currentIndex == 5 ? FontWeight.w500 : null),
            ),
            items: [
              PaneItem(
                selectedTileColor:
                ButtonState.all(const Color(0xff303742).withOpacity(0.5)),
                icon: const Icon(FluentIcons.database),
                title: const Text('Estoque'),
                body: Container(
                  color: Colors.blue,
                ),
              ),
              PaneItem(
                icon: const Icon(FluentIcons.circle_dollar),
                title: const Text('Preço Produto'),
                body: Container(
                  color: Colors.blue,
                ),
              ),
            ],
            body: SizedBox.shrink(
              child: ProductView(context: context),
            ),
          ),
          */
          PaneItem(
            selectedTileColor:
                ButtonState.all(const Color(0xff303742).withOpacity(0.5)),
            icon: const Icon(FluentIcons.product_catalog),
            title: Text(
              'Produtos',
              style: GoogleFonts.montserrat(
                  fontWeight: currentIndex == 5 ? FontWeight.w500 : null),
            ),
            body: SizedBox.shrink(
              child: ProductView(context: context),
            ),
          ),
          
          /*==============================================
            Categorias
          ===============================================*/
          PaneItem(
            selectedTileColor:
                ButtonState.all(const Color(0xff303742).withOpacity(0.5)),
            icon: const Icon(FluentIcons.user_window),
            title: Text(
              'Categorias',
              style: GoogleFonts.montserrat(
                  fontWeight: currentIndex == 6 ? FontWeight.w500 : null),
            ),
            body: SizedBox.shrink(
              child: CategoryView(
                context: context,
              ),
            ),
          ),
          PaneItemSeparator(color: Colors.grey[140]),
          /*==============================================
            CONFIGURAÇÕES
          ===============================================*/
          CutsomPaneItemHeader.customPaneItem(title: 'Configurações'),
          PaneItem(
            selectedTileColor:
                ButtonState.all(const Color(0xff303742).withOpacity(0.5)),
            icon: const Icon(FluentIcons.user_window),
            title: Text(
              'Configurações',
              style: GoogleFonts.montserrat(
                  fontWeight: currentIndex == 7 ? FontWeight.w500 : null),
            ),
            body: SizedBox.shrink(
              child: Container(color: Colors.green),
            ),
          ),
          PaneItem(
              selectedTileColor:
                  ButtonState.all(const Color(0xff303742).withOpacity(0.5)),
              icon: const Icon(FluentIcons.sign_out),
              title: Text(
                'Sair',
                style: GoogleFonts.montserrat(
                    fontWeight: currentIndex == 8 ? FontWeight.w500 : null),
              ),
              body: SizedBox.shrink(
                child: Container(color: Colors.white),
              ),
              onTap: () => _logout()),
        ],
      ),
    );
  }

  @override
  void onWindowClose() async {
    bool _isPreventClose = await windowManager.isPreventClose();
    if (_isPreventClose) {
      showDialog(
        context: context,
        builder: (_) {
          return ContentDialog(
            title: const Text('Confirmar fechamento'),
            content:
                const Text('Tem certeza de que deseja fechar a aplicação?'),
            actions: [
              FilledButton(
                child: const Text('Sim'),
                onPressed: () async {
                  Navigator.pop(context);
                  await SharedPref().removeInfoUser();
                  await windowManager.destroy();
                },
              ),
              Button(
                child: const Text('Não'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (_) {
        return ContentDialog(
          title: const Text('Confirmar fechamento'),
          content: const Text('Tem certeza de que deseja fechar a aplicação?'),
          actions: [
            FilledButton(
              child: const Text('Sim'),
              onPressed: () async {
                Navigator.pop(context);
                await SharedPref().removeInfoUser();
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
            Button(
              child: const Text('Não'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
