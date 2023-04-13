
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenu extends StatelessWidget {
  SideMenu({Key? key}) : super(key: key);

/*
  final PageStore pageStore = GetIt.I<PageStore>();

  void navigateTo(BuildContext context, String routeName) {
    GoRouter.of(context).go(routeName);
  }
*/
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
   //  backgroundColor: secondaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
             child: Container(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 9,
              decoration: BoxDecoration(
                color: Colors.white54,
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/img/logo_app.jpg'),
                ),
                borderRadius: BorderRadius.circular(10)
              ),
             ),
            ),
            /*
            Observer(
                builder: (_) => DrawerListTile(
                      title: 'Dashboard',
                      iconData: FontAwesomeIcons.chartLine,
                      press: () => navigateTo(context, Routes.dashboardRouter),
                      isSelect: pageStore.currentPage == Routes.dashboardRouter,
                    )),
            Observer(
                builder: (_) => DrawerListTile(
                      title: 'Locações',
                      iconData: FontAwesomeIcons.fileContract,
                      press: () => navigateTo(context, Routes.locationsRouter),
                      isSelect: pageStore.currentPage == Routes.locationsRouter,
                    )),
            Observer(
                builder: (_) => DrawerListTile(
                      title: 'Clientes',
                      iconData: FontAwesomeIcons.users,
                      press: () => navigateTo(context, Routes.clientsRouter),
                      isSelect: pageStore.currentPage == Routes.clientsRouter,
                    )),
            Observer(
                builder: (_) => DrawerListTile(
                      title: 'Produtos',
                      iconData: FontAwesomeIcons.listCheck,
                      press: () => navigateTo(context, Routes.productsRouter),
                      isSelect: pageStore.currentPage == Routes.productsRouter,
                    )),
            Observer(
                builder: (_) => DrawerListTile(
                      title: 'Categorias',
                      iconData: FontAwesomeIcons.list,
                      press: () => navigateTo(context, Routes.categoryRouter),
                      isSelect: pageStore.currentPage == Routes.categoryRouter,
                    )),
                    */
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.iconData,
    required this.press,
    required this.isSelect,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final VoidCallback press;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        //  color: isSelect ? bgColor : Colors.transparent,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))),
      child: ListTile(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        hoverColor: Colors.white12,
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: Icon(
          iconData,
          color: isSelect ? Colors.grey.shade50 : Colors.white54,
          size: 16,
        ),
        title: Text(
          title,
          style: GoogleFonts.roboto(color: isSelect ? Colors.grey.shade50 : Colors.white38,
          ) 
        ),
      ),
    );
  }
}
