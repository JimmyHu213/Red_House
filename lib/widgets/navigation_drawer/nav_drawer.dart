import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';
import 'package:red_house/router/route_names.dart';
import 'package:red_house/widgets/navigation_drawer/nav_drawer_header.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key, required this.onItemTap});
  final Function(int) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]),
        child: Column(
          children: <Widget>[
            const NavDrawerHeader(),
            DrawerItem(
              title: 'Home',
              icon: Icons.house,
              onTap: () => onItemTap(0),
            ),
            DrawerItem(
                title: 'Babes',
                icon: Icons.eighteen_up_rating,
                onTap: () => onItemTap(1)),
            DrawerItem(
              title: 'Specials',
              icon: Icons.star,
              onTap: () => onItemTap(2),
            ),
            DrawerItem(
                title: 'Location',
                icon: Icons.location_on,
                onTap: () => onItemTap(3)),
            DrawerItem(
                title: 'About', icon: Icons.info, onTap: () => onItemTap(4)),
          ],
        ));
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key, required this.title, this.icon, required this.onTap});
  final String title;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 30, top: 5),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: Icon(
            icon,
            color: primaryColor,
          ),
          onTap: onTap,
        ));
  }
}
