import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CallToActionMobile extends StatelessWidget {
  const CallToActionMobile(this.title, {super.key});
  final String title;

  Future<void> _makePhoneCall() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '+61 459635846');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      // Handle error, e.g., show a snackbar or dialog
      print('Could not launch $phoneUri');
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
