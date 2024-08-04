import 'package:flutter/material.dart';
import 'package:red_house/widgets/navigation_bar/navbar_moble.dart';
import 'package:red_house/widgets/navigation_bar/navbar_tablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: const NavBarMobile(), desktop: NavBarTabletDesktop());
  }
}
