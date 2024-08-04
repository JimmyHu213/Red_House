import 'package:flutter/material.dart';

class SpecialContentMobile extends StatelessWidget {
  const SpecialContentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text('Special Content Mobile $index'),
              ),
            );
          },
        ),
      ),
    );
  }
}
