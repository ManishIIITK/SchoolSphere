import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/students/gallery_screen/data/images_model.dart';
import 'package:school_management_app/screens/students/gallery_screen/image_view_screen.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  static const routeName = 'GalleryScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Gallery'),
        centerTitle: true,
      ),
      backgroundColor: kOtherColor,
      body: GridView.builder(
        padding: const EdgeInsets.all(kDefaultPadding / 2.5),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: GalleryImages.schoolImages.length,
        itemBuilder: (context, index) {
          final imageUrl = GalleryImages.schoolImages[index];

          return GestureDetector(
            onTap: () {
              // Navigate to the full-screen image view
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ImageViewScreen(imageUrl: imageUrl),
                ),
              );
            },
            child: Hero(
              tag: imageUrl, // Use the same tag in the ImageViewScreen
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
