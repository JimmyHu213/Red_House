import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: 240,
        child: Image.asset(
          'assets/image/logo.png',
          fit: BoxFit.contain,
        ));
  }
}
