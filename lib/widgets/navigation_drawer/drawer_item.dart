import 'package:flutter/material.dart';
import 'package:red_house/widgets/navigation_bar/navbar_item.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.navigationPath});
  final String title;
  final String navigationPath;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 30, top: 60),
        child: Row(
          children: <Widget>[
            Icon(icon),
            const SizedBox(width: 30),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ));
  }
}
