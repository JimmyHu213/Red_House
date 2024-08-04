import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IntroDetails extends StatelessWidget {
  const IntroDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var textAlignment =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? TextAlign.left
              : TextAlign.center;
      double titleSize =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 50
              : 80;
      return SizedBox(
          width: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Stack(children: <Widget>[
                Text('RedHouse Babes',
                    style: TextStyle(
                      //color: primaryColor,
                      fontWeight: FontWeight.w800,
                      height: 0.9,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 4
                        ..color = Colors.white,
                      fontSize: titleSize,
                    ),
                    textAlign: textAlignment),
                Text('RedHouse Babes',
                    style: TextStyle(
                      //color: primaryColor,
                      fontWeight: FontWeight.w800,
                      height: 0.9,
                      color: primaryColor,
                      fontSize: titleSize,
                    ),
                    textAlign: textAlignment),
              ]),
            ],
          ));
    });
  }
}
