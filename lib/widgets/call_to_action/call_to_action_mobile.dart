import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';
import 'package:red_house/constants/mobile_number.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart' show kIsWeb;

class CallToActionMobile extends StatelessWidget {
  const CallToActionMobile(this.title, {super.key});
  final String title;

  void _makePhoneCall() {
    if (kIsWeb) {
      html.window.open('tel:$MOBILE_NUMBER', '_blank');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _makePhoneCall,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        elevation: 6,
        shadowColor: Colors.black45,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Container(
        height: 60,
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
