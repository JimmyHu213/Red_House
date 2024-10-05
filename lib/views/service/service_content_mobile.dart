import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:red_house/constants/app_colors.dart';
import 'package:red_house/widgets/title_text.dart';

class ServiceContentMobile extends StatelessWidget {
  const ServiceContentMobile({Key? key}) : super(key: key);

  Future<Map<String, List<String>>> getGirlsImages() async {
    Map<String, List<String>> girlsImages = {};

    try {
      final ListResult result =
          await FirebaseStorage.instance.ref('girls_images').listAll();

      for (final Reference folder in result.prefixes) {
        String girlName = folder.name;
        List<String> imageUrls = [];

        final ListResult girlImages = await folder.listAll();
        for (final Reference imageRef in girlImages.items) {
          final String downloadUrl = await imageRef.getDownloadURL();
          imageUrls.add(downloadUrl);
        }

        if (imageUrls.isNotEmpty) {
          girlsImages[girlName] = imageUrls;
        }
      }
    } catch (e) {
      print('Error fetching images: $e');
    }

    return girlsImages;
  }

  void _showImageDialog(BuildContext context, List<String> images) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          images[index],
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text('Close'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleTextWidget(title: 'Our Babes'),
        const Text(
          '(OnTap to view more images)',
          style: TextStyle(color: primaryColor, fontSize: 12),
        ),
        const SizedBox(height: 20),
        FutureBuilder<Map<String, List<String>>>(
          future: getGirlsImages(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No images found');
            } else {
              List<MapEntry<String, List<String>>> girlEntries =
                  snapshot.data!.entries.toList();
              return Container(
                height: 700,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: girlEntries.length,
                  itemBuilder: (context, index) {
                    String girlName = girlEntries[index].key;
                    List<String> images = girlEntries[index].value;
                    return GestureDetector(
                      onTap: () => _showImageDialog(context, images),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(12),
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
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                images.first,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  print('Error loading image: $error');
                                  return Container(
                                    color: Colors.grey[300],
                                    child: Icon(Icons.error, color: Colors.red),
                                  );
                                },
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  color: Colors.black.withOpacity(0.5),
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    girlName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
