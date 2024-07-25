import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String _currentRoute = '/'; // Default route

  String get currentRoute => _currentRoute;

  Future<dynamic> navigateTo(String routeName) {
    _currentRoute = routeName; // Update the current route
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void goBack() {
    navigatorKey.currentState!.pop();
    // You might want to update _currentRoute here as well,
    // but it's tricky without context. You could use a stack to keep track of routes.
  }
}
