// posts_list_screen.dart
import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/students/marks_screen/data/post_data.dart';
import 'package:school_management_app/screens/students/marks_screen/marks_post_details_screen.dart';
import 'package:school_management_app/screens/students/marks_screen/model/post_model.dart';

class MarksPostScreen extends StatelessWidget {
  final List<Post> posts = getPostsData();
  static const routeName = 'MarksPostScreen';

  MarksPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts List'),
        centerTitle: true,
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
          padding: const EdgeInsets.all(kDefaultPadding / 2.5),
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15.0), // Set border radius
                ),
                color: kPrimaryColor.withOpacity(0.7),
                child: ListTile(
                  title: Text(
                    posts[index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    posts[index].subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MarksPostDetailScreen.routeName,
                      arguments: posts[
                          index], // Pass the selected post to the details screen
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
