import 'package:flutter/material.dart';
import 'package:red_house/views/home/home_content_desktop.dart';
import 'package:red_house/views/home/home_content_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: const HomeContentMobile(), desktop: const HomeContentDesktop());
  }
}
