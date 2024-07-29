import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';
import 'package:red_house/widgets/navigation_bar/navbar_logo.dart';

class NavBarMobile extends StatelessWidget {
  const NavBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      height: 80,
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu)),
            const NavBarLogo()
          ]),
    );
  }
}
