import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';

class NavDrawerHeader extends StatelessWidget {
  const NavDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        color: primaryColor,
        alignment: Alignment.center,
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Skill Up Now',
                style: TextStyle(fontSize: 18, color: Colors.white)),
            Text('Tap Here',
                style: TextStyle(fontSize: 18, color: Colors.white))
          ],
        ));
  }
}
