import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';
import 'package:red_house/constants/special_list.dart';
import 'package:red_house/widgets/title_text.dart';

class SpecialContentMobile extends StatelessWidget {
  const SpecialContentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (specialItems.length / 3).ceil() * 150 + 250,
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
          const TitleTextWidget(title: '\$\$\$Price List\$\$\$'),
          const Column(
            children: [
              Card(
                color: secondaryColor,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Asian girls full service price lists:\n20 mins: \$120\n30 mins: \$150\n60 mins: \$250',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: primaryColor),
                  ),
                ),
              ),
              Card(
                color: secondaryColor,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Aussie girls under 25yo price lists:\n15 mins: \$150\n20 mins: \$200\n30 mins: \$250\n60 mins: \$400',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: primaryColor),
                  ),
                ),
              ),
              Card(
                color: secondaryColor,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'White girls over 25yo price lists:\n20 mins: \$150\n30 mins: \$200\n60 mins: \$350',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: primaryColor),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
