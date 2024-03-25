// image_view_screen.dart

import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';

class ImageViewScreen extends StatelessWidget {
  final String imageUrl;

  const ImageViewScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOtherColor,
      body: GestureDetector(
        onTap: () {
          // Close the full-screen view when tapped
          Navigator.of(context).pop();
        },
        child: Center(
          child: Hero(
            tag: imageUrl, // Use the same tag as in the GalleryScreen
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
