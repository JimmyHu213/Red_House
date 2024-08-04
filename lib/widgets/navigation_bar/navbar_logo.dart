import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(
    BuildContext context,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => GestureDetector(
        onTap: onTap,
        child: SizedBox(
            height: double.infinity,
            width: 240,
            child: Image.asset(
              'assets/image/logo.png',
              fit: BoxFit.contain,
            )),
      ),
      desktop: (BuildContext context) => GestureDetector(
        onTap: () => {},
        child: SizedBox(
            height: double.infinity,
            width: 240,
            child: Image.asset(
              'assets/image/logo.png',
              fit: BoxFit.contain,
            )),
      ),
    );
  }
}
