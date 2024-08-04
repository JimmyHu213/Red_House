import 'package:flutter/material.dart';
import 'package:red_house/model/girl.dart';

class GirlCard extends StatelessWidget {
  final Girl girl;

  const GirlCard({Key? key, required this.girl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400, // Adjust as needed
      height: 400, // Adjust as needed
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            bottom: 80,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  girl.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 50,
            child: Text(
              girl.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            right: 20,
            child: Text(
              girl.description,
              style: TextStyle(
                fontSize: 16,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
