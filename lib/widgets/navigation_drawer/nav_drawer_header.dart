import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';
import 'package:red_house/widgets/animated_arrow.dart';

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
            Text('Best Service in Town!',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700)),
            Divider(
              color: Colors.white,
              thickness: 2,
              indent: 50,
              endIndent: 50,
            ),
            AnimatedTextWithArrow(
              text: 'Hit to See More !',
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 16),
            )
          ],
        ));
  }
}
