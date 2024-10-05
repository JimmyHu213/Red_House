import 'package:flutter/material.dart';
import 'package:red_house/constants/app_colors.dart';
import 'package:red_house/constants/special_list.dart';
import 'package:red_house/widgets/title_text.dart';

class SpecialContentMobile extends StatelessWidget {
  const SpecialContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TitleTextWidget(title: 'Specials'),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            padding: const EdgeInsets.all(8),
            itemCount: specialItems.length,
            itemBuilder: (context, index) {
              return Card(
                color: primaryColor,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        size: 32,
                        color: Colors.white,
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${specialItems[index]}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          const TitleTextWidget(title: '\$\$\$ Price List \$\$\$'),
          const SizedBox(height: 8),
          _buildPriceCard('Asian girls full service price lists:', {
            '20 mins': '\$120',
            '30 mins': '\$150',
            '60 mins': '\$250',
          }),
          const SizedBox(height: 8),
          _buildPriceCard('Aussie girls under 25yo price lists:', {
            '15 mins': '\$150',
            '20 mins': '\$200',
            '30 mins': '\$250',
            '60 mins': '\$400',
          }),
          const SizedBox(height: 8),
          _buildPriceCard('White girls over 25yo price lists:', {
            '20 mins': '\$150',
            '30 mins': '\$200',
            '60 mins': '\$350',
          }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildPriceCard(String title, Map<String, String> prices) {
    return Card(
      color: primaryColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            ...prices.entries.map((entry) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        entry.key,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        entry.value,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
