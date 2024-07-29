import 'package:flutter/material.dart';
import 'package:red_house/locator.dart';
import 'package:red_house/services/navigation_service.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem(this.title, {super.key, required this.navigationPath});

  final String navigationPath;
  final String title;

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
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
