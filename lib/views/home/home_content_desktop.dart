import 'package:flutter/material.dart';
import 'package:red_house/widgets/call_to_action/call_to_action.dart';
import 'package:red_house/widgets/intro_details/intro_details.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image/background.jpg'),
              fit: BoxFit.cover)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IntroDetails(),
          Padding(
            padding: EdgeInsets.only(right: 100),
            child: CallToAction(title: 'Call Now'),
          )
        ],
      ),
    );
  }
}
