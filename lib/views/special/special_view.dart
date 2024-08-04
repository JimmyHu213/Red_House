import 'package:flutter/material.dart';
import 'package:red_house/views/special/special_content_desktop.dart';
import 'package:red_house/views/special/special_content_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SpecialView extends StatelessWidget {
  const SpecialView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: SpecialContentMobile(),
      desktop: SpecialContentDesktop(),
    );
  }
}
