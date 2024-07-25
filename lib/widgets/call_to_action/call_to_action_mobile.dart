import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';

class CallToActionMobile extends StatelessWidget {
  const CallToActionMobile(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                color: Colors.black45, offset: Offset(3, 3), blurRadius: 6)
          ]),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.w800),
      ),
    );
  }
}
