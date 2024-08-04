import 'package:flutter/material.dart';
import 'package:red_house/views/location/location_content_desktop.dart';
import 'package:red_house/views/location/location_content_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const LocationContentMobile(),
      desktop: const LocationContentDesktop(),
    );
  }
}
