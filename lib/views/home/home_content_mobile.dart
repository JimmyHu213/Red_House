import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';
import 'package:red_house/widgets/call_to_action/call_to_action.dart';
import 'package:red_house/widgets/intro_details/intro_details.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image/background.jpg'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IntroDetails(),
          SizedBox(
            height: 100,
          ),
          CallToAction(title: 'Call Now'),
          Text(
            'Best Escort in Victoria\nCome and enjoy the very young sexy pretty girls with great service.',
            style: TextStyle(
                fontSize: 16,
                height: 1.7,
                color: Colors.white,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
