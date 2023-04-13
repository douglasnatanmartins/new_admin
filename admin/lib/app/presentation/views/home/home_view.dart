// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:admin/app/presentation/views/base/components/custom_pane_item_header.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WindowListener{
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
        indicator: const EndNavigationIndicator(),
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
                left: 10,
                bottom: 10,
                right: 10,
              ),
            )),
        items: [
          CutsomPaneItemHeader.customPaneItem(title: 'Home'),
          PaneItem(
            icon: const Icon(FluentIcons.chart_series),
            title: const Text('Dashboard'),
            body: SizedBox.shrink(
              child: Container(color: Colors.white),
            ),
          ),
          PaneItemSeparator(),
          CutsomPaneItemHeader.customPaneItem(title: 'Locações'),
          PaneItem(
            icon: const Icon(FluentIcons.money),
            title: const Text('Orçamentos'),
            body: SizedBox.shrink(
              child: Container(color: Colors.red),
            ),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.invoice),
            title: const Text('Contratos'),
            body: SizedBox.shrink(
              child: Container(color: Colors.yellow),
            ),
          ),
          PaneItemSeparator(),
          CutsomPaneItemHeader.customPaneItem(title: 'Cadastros'),
          PaneItem(
            icon: const Icon(FluentIcons.people),
            title: const Text('Clientes'),
            body: SizedBox.shrink(
              child: Container(color: Colors.blue),
            ),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.product_catalog),
            title: const Text('Produtos'),
            body: SizedBox.shrink(
              child: Container(color: Colors.black),
            ),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.user_window),
            title: const Text('Usuarios'),
            body: SizedBox.shrink(
              child: Container(color: Colors.purple),
            ),
          ),
          PaneItemSeparator(),
          CutsomPaneItemHeader.customPaneItem(title: 'Configurações'),
          PaneItem(
            icon: const Icon(FluentIcons.user_window),
            title: const Text('Configurações'),
            body: SizedBox.shrink(
              child: Container(color: Colors.green),
            ),
          ),
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
            content: const Text('Tem certeza de que deseja fechar a aplicação?'),
            actions: [
              FilledButton(
                child: const Text('Sim'),
                onPressed: () {
                  Navigator.pop(context);
                  windowManager.destroy();
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
}
