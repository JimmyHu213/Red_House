import 'package:flutter/material.dart';
import 'package:red_house/views/about/about_view.dart';
import 'package:red_house/views/home/home_view.dart';
import 'package:red_house/router/route_names.dart';
import 'package:red_house/views/location/location_view.dart';
import 'package:red_house/views/service/service_view.dart';
import 'package:red_house/views/special/special_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(const HomeViewPage());
    case SpecialsRoute:
      return _getPageRoute(const SpecialView());
    case ServicesRoute:
      return _getPageRoute(const ServiceView());
    case LocationsRoute:
      return _getPageRoute(const LocationView());
    case AboutRoute:
      return _getPageRoute(const AboutView());
    default:
      throw Exception('Invalid route: ${settings.name}');
  }
}

PageRoute _getPageRoute(Widget child) {
  return _FadeRoute(page: child);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget page;

  _FadeRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = 0.0;
            var end = 1.0;
            var curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
        );
}
