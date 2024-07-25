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
      double descriptionSize =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 16
              : 21;
      return SizedBox(
          width: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('RedHouse Babes',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      height: 0.9,
                      fontSize: titleSize,
                      color: primaryColor),
                  textAlign: textAlignment),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Best of Mildura/Shipparton/Melbourne Brothel \nCome and enjoy the best service in town.',
                style: TextStyle(
                    fontSize: descriptionSize,
                    height: 1.7,
                    color: Colors.white),
                textAlign: textAlignment,
              ),
            ],
          ));
    });
  }
}
