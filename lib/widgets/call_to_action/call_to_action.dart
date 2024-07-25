import 'package:flutter/material.dart';
import 'package:red_house/widgets/call_to_action/call_to_action_mobile.dart';
import 'package:red_house/widgets/call_to_action/call_to_action_table.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: CallToActionMobile(title),
        desktop: CallToActionTableDesktop(title));
  }
}
