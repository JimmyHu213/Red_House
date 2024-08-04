import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';
import 'package:red_house/widgets/title_text.dart';

class SpecialContentMobile extends StatelessWidget {
  const SpecialContentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (specialItems.length / 3).ceil() * 150,
      width: double.infinity,
      child: Column(
        children: [
          const TitleTextWidget(title: 'Specials'),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Increased to 3 items per row
                crossAxisSpacing: 4, // Reduced spacing
                mainAxisSpacing: 4, // Reduced spacing
                childAspectRatio: 1.5, // Width is 1.5 times the height
              ),
              padding: const EdgeInsets.all(
                  4), // Add some padding around the entire grid
              itemCount: specialItems.length,
              itemBuilder: (context, index) {
                return Card(
                  color: secondaryColor,
                  elevation: 2,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          size: 24,
                          color: primaryColor,
                        ), // Smaller icon
                        SizedBox(height: 4),
                        Text(
                          '${specialItems[index]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500), // Smaller font
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List specialItems = [
  'Aussie Girl',
  'Asian Girl',
  'Euro Girl',
  'Squrting',
  'Blowjob',
  'Cumshot',
  'Threesome',
];
