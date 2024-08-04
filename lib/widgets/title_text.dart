import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.italic,
          color: primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
