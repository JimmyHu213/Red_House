import 'package:flutter/material.dart';
import 'package:red_house/views/service/service_content_desktop.dart';
import 'package:red_house/views/service/service_content_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ServiceView extends StatelessWidget {
  const ServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: const ServiceContentMobile(),
        desktop: const ServiceContentDesktop());
  }
}
