import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';
import 'package:red_house/constants/mobile_number.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutContentMobile extends StatelessWidget {
  const AboutContentMobile({super.key});

  Future<void> _makePhoneCall(BuildContext context) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: MOBILE_NUMBER);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      _showErrorDialog(context, 'Could not launch phone call.');
    }
  }

  Future<void> _sendTextMessage(BuildContext context) async {
    final Uri smsUri = Uri(scheme: 'sms', path: MOBILE_NUMBER);
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      _showErrorDialog(context, 'Could not launch messaging app.');
    }
  }

  Future<void> _launchMap(String address) async {
    final encodedAddress = Uri.encodeComponent(address);
    final Uri mapUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$encodedAddress');

    if (await canLaunchUrl(mapUrl)) {
      await launchUrl(mapUrl);
    } else {
      print('Could not launch $mapUrl');
      // You might want to show an error dialog here
    }
  }

  Widget _buildAddressText(String address, String phone) {
    return GestureDetector(
      onTap: () => _launchMap(address),
      child: Text(
        '$address\nPhone: $phone',
        style: TextStyle(
          color: Colors.black,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(color: secondaryColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('RedHouse Babes',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () => {_makePhoneCall(context)},
                          icon: const Icon(
                            Icons.call,
                            color: primaryColor,
                          )),
                      IconButton(
                          onPressed: () => {_sendTextMessage(context)},
                          icon: const Icon(
                            Icons.chat_bubble,
                            color: primaryColor,
                          ))
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Find Us: ',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  _buildAddressText(
                      '11 Packham St, Shepparton VIC', '0459635846'),
                  SizedBox(height: 10), // Add some space between addresses
                  _buildAddressText('83A Bridge Rd, Buronga NSW', '0499312283'),
                ],
              )
            ],
          ),
        ));
  }
}
