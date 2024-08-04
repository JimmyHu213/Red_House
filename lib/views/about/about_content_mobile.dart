import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';
import 'package:red_house/constants/mobile_number.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart' show kIsWeb;

class AboutContentMobile extends StatelessWidget {
  const AboutContentMobile({super.key});

  void _makePhoneCall(BuildContext context) {
    if (kIsWeb) {
      html.window.open('tel:$MOBILE_NUMBER', '_blank');
    } else {
      _launchUrl('tel:$MOBILE_NUMBER', context);
    }
  }

  void _sendTextMessage(BuildContext context) {
    if (kIsWeb) {
      html.window.open('sms:$MOBILE_NUMBER', '_blank');
    } else {
      _launchUrl('sms:$MOBILE_NUMBER', context);
    }
  }

  void _launchMap(String address, BuildContext context) {
    final encodedAddress = Uri.encodeComponent(address);
    final mapUrl =
        'https://www.google.com/maps/search/?api=1&query=$encodedAddress';

    if (kIsWeb) {
      html.window.open(mapUrl, '_blank');
    } else {
      _launchUrl(mapUrl, context);
    }
  }

  Future<void> _launchUrl(String urlString, BuildContext context) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $urlString')),
      );
    }
  }

  Widget _buildAddressText(String address, String phone, BuildContext context) {
    return GestureDetector(
      onTap: () => _launchMap(address, context),
      child: Text(
        '$address\nPhone: $phone',
        style: const TextStyle(
          color: Colors.black,
          decoration: TextDecoration.underline,
        ),
      ),
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
                  const Text(
                    'Global Sexy Girl Service\nAge between 18 and 25\nLots of fun ❤️ ❤️ ❤️ ',
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
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
                      '11 Packham St, Shepparton VIC', '0459635846', context),
                  _buildAddressText(
                      '83A Bridge Rd, Buronga NSW', '0499312283', context),
                  _buildAddressText('3 Parkes way, Burnside Heights VIC',
                      '0473311660', context)
                ],
              )
            ],
          ),
        ));
  }
}
