import 'package:flutter/material.dart';
import 'package:red_house/locator.dart';
import 'package:red_house/router/route_names.dart';
import 'package:red_house/router/router.dart';
import 'package:red_house/services/navigation_service.dart';
import 'package:red_house/views/about/about_view.dart';
import 'package:red_house/views/home/home_view.dart';
import 'package:red_house/views/location/location_view.dart';
import 'package:red_house/views/service/service_view.dart';
import 'package:red_house/views/special/special_view.dart';
import 'package:red_house/widgets/centered_view/centered_view.dart';
import 'package:red_house/widgets/navigation_drawer/nav_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:red_house/widgets/navigation_bar/navigation_bar.dart' as navbar;

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? const NavDrawer()
            : null,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CenteredView(
            child: Column(
              children: <Widget>[
                const navbar.NavigationBar(),
                sizingInformation.deviceScreenType == DeviceScreenType.mobile
                    ? const Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [HomeViewPage(), AboutView()],
                          ),
                        ),
                      )
                    : Expanded(
                        child: Navigator(
                          key: locator<NavigationService>().navigatorKey,
                          onGenerateRoute: generateRoute,
                          initialRoute: HomeRoute,
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
