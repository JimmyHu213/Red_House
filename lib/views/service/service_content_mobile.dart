import 'package:flutter/material.dart';
import 'package:red_house/model/girl.dart';
import 'package:red_house/widgets/pic_cell/girl_card.dart';
import 'package:red_house/widgets/title_text.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ServiceContentMobile extends StatelessWidget {
  const ServiceContentMobile({super.key});

  Future<List<String>> getImageUrls() async {
    List<String> imageUrls = [];

    try {
      final ListResult result =
          await FirebaseStorage.instance.ref('girls_images').listAll();

      print('Number of items found: ${result.items.length}');

      for (final Reference ref in result.items) {
        final String downloadUrl = await ref.getDownloadURL();
        imageUrls.add(downloadUrl);
      }
    } catch (e) {
      print('Error fetching images: $e');
    }

    return imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleTextWidget(title: 'Our Babes'),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder<List<String>>(
          future: getImageUrls(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No images found');
            } else {
              return Container(
                height: 600,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(8), // Add some space between items
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey, width: 2), // Add border
                        borderRadius:
                            BorderRadius.circular(12), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10), // Clip the image to match the border radius
                        child: Image.network(
                          snapshot.data![index],
                          fit: BoxFit.cover,
                          width: 300, // Set a fixed width for each image
                          errorBuilder: (context, error, stackTrace) {
                            print('Error loading image: ${error}');
                            return Container(
                              width: 300,
                              color: Colors.grey[300],
                              child: Icon(Icons.error, color: Colors.red),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
