import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:panel_admin_pulsa/common/constants.dart';
import 'package:panel_admin_pulsa/presentation/pages/banners/banners_page.dart';
import 'package:panel_admin_pulsa/presentation/pages/products/products.dart';
import 'package:panel_admin_pulsa/presentation/provider/auth_notifier.dart';
import 'package:provider/provider.dart';

class MyScaffold extends StatelessWidget {
  MyScaffold({
    Key? key,
    required this.route,
    required this.body,
    required this.title,
  }) : super(key: key);

  final Widget body;
  final String route;
  final String title;

  final List<AdminMenuItem> _sideBarItems = const [
    AdminMenuItem(
      title: 'Dashboard',
      route: '/',
      icon: Icons.dashboard,
    ),
    AdminMenuItem(
      title: 'Products',
      icon: Icons.shopping_basket,
      // route: '/products',
      children: [
        AdminMenuItem(
          title: 'All-products',
          route: ProductsPage.ROUTE_NAME,
        ),
        AdminMenuItem(
          title: 'Banner',
          route: BannersPage.ROUTE_NAME,
        )
      ],
    ),
    AdminMenuItem(
      title: 'Transaksi',
      icon: Icons.money,
      route: '/transaksi',
    ),
  ];

  final List<AdminMenuItem> _adminMenuItems = [
    AdminMenuItem(
      title: 'Logout',
      icon: Icons.logout,
      onTap: (context) {
        Provider.of<AuthNotifier>(context, listen: false).logout();
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(title, style: kHeading6),
        centerTitle: true,
        shadowColor: kDefaultShadowColor,
        surfaceTintColor: kDefaultShadowColor,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.safety_check, color: Colors.white),
            color: Colors.white,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          PopupMenuButton<AdminMenuItem>(
            child: const Icon(Icons.account_circle),
            itemBuilder: (context) {
              return _adminMenuItems.map((AdminMenuItem item) {
                return PopupMenuItem<AdminMenuItem>(
                  onTap: () {
                    if (item.onTap != null) {
                      item.onTap!(context);
                    }
                    // Navigator.of(context).pushNamed(item.route!);
                  },
                  value: item,
                  child: Row(
                    children: [
                      Icon(item.icon),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      sideBar: SideBar(
        backgroundColor: secondaryColor,
        activeBackgroundColor: primaryColor,
        borderColor: Colors.white,
        iconColor: primaryColor,
        activeIconColor: secondaryColor,
        textStyle: const TextStyle(
          color: primaryColor,
          fontSize: 13,
        ),
        activeTextStyle: const TextStyle(
          color: secondaryColor,
          fontSize: 13,
        ),
        items: _sideBarItems,
        selectedRoute: route,
        onSelected: (item) {
          print(
              'sideBar: onTap(): title = ${item.title}, route = ${item.route}');
          if (item.route != null && item.route != route) {
            Navigator.of(context).pushNamed(item.route!);
          }
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'header',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
  }
}
