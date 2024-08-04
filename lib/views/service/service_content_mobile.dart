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
    return FutureBuilder<List<String>>(
      future: getImageUrls(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No images found');
        } else {
          print('Number of images: ${snapshot.data![0]}');
          return Image.network(
            snapshot.data![0],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              print('Error loading image: ${error}');
              return Container(
                color: Colors.grey[300],
                child: Icon(Icons.error, color: Colors.red),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          );
          // return Column(
          //   children: [
          //     const TitleTextWidget(title: 'Our Babes'),
          //     Container(
          //       height: 600,
          //       child: ListView.builder(
          //         scrollDirection: Axis.horizontal,
          //         itemCount: snapshot.data!.length,
          //         itemBuilder: (context, index) {
          //           return Image.network(
          //             snapshot.data![index],
          //             fit: BoxFit.cover,
          //             errorBuilder: (context, error, stackTrace) {
          //               print('Error loading image: ${error}');
          //               return Container(
          //                 color: Colors.grey[300],
          //                 child: Icon(Icons.error, color: Colors.red),
          //               );
          //             },
          //             loadingBuilder: (context, child, loadingProgress) {
          //               if (loadingProgress == null) return child;
          //               return Center(
          //                 child: CircularProgressIndicator(
          //                   value: loadingProgress.expectedTotalBytes != null
          //                       ? loadingProgress.cumulativeBytesLoaded /
          //                           loadingProgress.expectedTotalBytes!
          //                       : null,
          //                 ),
          //               );
          //             },
          //           );
          //         },
          //       ),
          //     ),
          //   ],
          // );
        }
      },
    );
  }
}

final List<Girl> girls = [
  Girl(
      name: 'Lulu',
      description: 'Lovely Local',
      imageUrl: 'assets/image/logo.png'),
  Girl(
      name: 'Lala',
      description: 'Lovely Local',
      imageUrl: 'assets/image/logo.png'),
  Girl(
      name: 'Lili',
      description: 'Lovely Local',
      imageUrl: 'assets/image/logo.png'),
  Girl(
      name: 'Lolo',
      description: 'Lovely Local',
      imageUrl: 'assets/image/logo.png'),
];
