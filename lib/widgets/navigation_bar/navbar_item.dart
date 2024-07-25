import 'package:flutter/material.dart';
import 'package:red_house/locator.dart';
import 'package:red_house/services/navigation_service.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem(this.title,
      {super.key, required this.navigationPath, required this.isActive});

  final String navigationPath;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().navigateTo(navigationPath);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: isActive ? Colors.yellow : Colors.white,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 2,
              width: 20,
              color: Colors.yellow,
            ),
        ],
      ),
    );
  }
}
