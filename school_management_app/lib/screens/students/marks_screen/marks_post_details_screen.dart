
import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/students/marks_screen/model/post_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MarksPostDetailScreen extends StatelessWidget {
  final Post post;

  const MarksPostDetailScreen({super.key, required this.post});
  static const routeName = "MarksPostDetailScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: kOtherColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kDefaultPadding),
            topRight: Radius.circular(kDefaultPadding),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kTextBlackColor),
              ),
              const SizedBox(height: 10),
              Text(
                post.description,
                style: const TextStyle(fontSize: 16, color: kTextBlackColor),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Your button click logic here
                },
                child: const Row(
                  mainAxisSize: MainAxisSize
                      .min, // Using MainAxisSize.min to make the Row as small as possible
                  children: [
                    Flexible(
                      child: Text('Download Attachment'),
                    ),
                    kWidthSizedBox,
                    Icon(Icons.download),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to launch the URL
  Future<void> _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}