import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';
import 'package:red_house/locator.dart';
import 'package:red_house/router/route_names.dart';
import 'package:red_house/services/navigation_service.dart';
import 'package:red_house/widgets/navigation_bar/navbar_item.dart';
import 'package:red_house/widgets/navigation_bar/navbar_logo.dart';

class NavBarTabletDesktop extends StatelessWidget {
  const NavBarTabletDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = locator<NavigationService>().currentRoute;
    return Container(
      color: primaryColor,
      child: SizedBox(
        height: 100,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              NavBarLogo(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NavBarItem(
                    "Home",
                    navigationPath: HomeRoute,
                    isActive: currentRoute == HomeRoute,
                  ),
                  SizedBox(width: 60),
                  NavBarItem(
                    "Specials",
                    navigationPath: SpecialsRoute,
                    isActive: currentRoute == SpecialsRoute,
                  ),
                  SizedBox(width: 60),
                  NavBarItem(
                    "Services",
                    navigationPath: ServicesRoute,
                    isActive: currentRoute == ServicesRoute,
                  ),
                  SizedBox(width: 60),
                  NavBarItem(
                    "Locations",
                    navigationPath: LocationsRoute,
                    isActive: currentRoute == LocationsRoute,
                  ),
                  SizedBox(width: 60),
                  NavBarItem(
                    "About",
                    navigationPath: AboutRoute,
                    isActive: currentRoute == AboutRoute,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
