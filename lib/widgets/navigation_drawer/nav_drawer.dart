import 'package:flutter/material.dart';
import 'package:red_house/router/route_names.dart';
import 'package:red_house/widgets/navigation_drawer/drawer_item.dart';
import 'package:red_house/widgets/navigation_drawer/nav_drawer_header.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]),
        child: const Column(
          children: <Widget>[
            NavDrawerHeader(),
            DrawerItem(
                title: 'Home', icon: Icons.videocam, navigationPath: HomeRoute),
            DrawerItem(
                title: 'About', icon: Icons.help, navigationPath: AboutRoute),
          ],
        ));
  }
}
