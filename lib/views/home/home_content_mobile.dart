import 'package:flutter/material.dart';
import 'package:red_house/widgets/call_to_action/call_to_action.dart';
import 'package:red_house/widgets/intro_details/intro_details.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntroDetails(),
            SizedBox(
              height: 100,
            ),
            CallToAction(title: 'Call Now'),
          ],
        ),
      ),
    );
  }
}
