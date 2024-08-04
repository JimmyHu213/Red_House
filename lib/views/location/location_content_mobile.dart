import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';
import 'package:red_house/widgets/title_text.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';

class LocationContentMobile extends StatelessWidget {
  const LocationContentMobile({super.key});

  void _launchMap(String address) {
    final encodedAddress = Uri.encodeComponent(address);
    final mapUrl =
        'https://www.google.com/maps/search/?api=1&query=$encodedAddress';

    if (kIsWeb) {
      html.window.open(mapUrl, '_blank');
    } else {
      _launchUrl(mapUrl);
    }
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      print('Could not launch $urlString');
    }
  }

  Widget _buildAddressText(String address) {
    return GestureDetector(
      onTap: () => _launchMap(address),
      child: Text(
        '$address',
        style: const TextStyle(
          color: Colors.black,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const TitleTextWidget(title: 'Locations'),
            const SizedBox(height: 20),
            _buildLocationCard(
              'assets/image/shepparton.png',
              '11 Packham St, Shepparton VIC',
              'Shepparton',
            ),
            const SizedBox(height: 20),
            _buildLocationCard(
              'assets/image/buronga.png',
              '83A Bridge Rd, Buronga NSW',
              'Buronga',
            ),
            const SizedBox(height: 20),
            _buildLocationCard(
              'assets/image/burnside.png',
              '3 Parkes way, Burnside Heights VIC',
              'Burnside',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationCard(String imagePath, String address, String title) {
    return Card(
      color: secondaryColor,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                imagePath,
                height:
                    200, // Adjust this value to make images smaller or larger
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            TitleTextWidget(title: title),
            const SizedBox(height: 8),
            _buildAddressText(address),
          ],
        ),
      ),
    );
  }
}
