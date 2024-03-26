import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/teachers/Announcement_Screen/data/post.dart';
import 'package:school_management_app/screens/teachers/Announcement_Screen/model/post_model.dart';

class TeacherAnnouncementScreen extends StatefulWidget {
  const TeacherAnnouncementScreen({Key? key}) : super(key: key);

  static const routeName = 'TeacherAnnouncementScreen';

  @override
  _TeacherAnnouncementScreenState createState() =>
      _TeacherAnnouncementScreenState();
}

class _TeacherAnnouncementScreenState extends State<TeacherAnnouncementScreen> {
  final TextEditingController _announcementController = TextEditingController();
  final List<Post> _announcements = dummyPosts; // Initialize with dummy data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Announcement'),
        backgroundColor: kPrimaryColor, // Set primary color to blue
      ),
      body: Container(
        color: Colors.white, // Set the background color to white
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // First half: Post Announcement
              TextField(
                controller: _announcementController,
                decoration: const InputDecoration(
                  hintText: 'Type your announcement here',
                ),
                style: const TextStyle(color: kTextBlackColor),
                // maxLines: null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Simulate posting an announcement
                  String announcementText = _announcementController.text;
                  // Create a new post and add it to the list (simulating a database)
                  _announcements.add(Post(
                    dateTime: DateTime.now(), // Use the current date and time
                    description: announcementText,
                  ));
                  // Clear the text field after posting
                  _announcementController.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor, // Set button color to blue
                ),
                child: const Text('Post Announcement'),
              ),
              const SizedBox(height: 20),
              // Second half: Display Announcements
              Expanded(
                child: ListView.builder(
                  itemCount: _announcements.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: kPrimaryColor.withOpacity(0.7),
                      child: ListTile(
                        title: Text(
                          'Posted on: ${_announcements[index].dateTime.toString()}',
                          style: const TextStyle(
                            color:
                                Colors.white, // Set title text color to white
                            fontSize: 12, // Increased font size
                            fontWeight: FontWeight.bold, // Bold title
                          ),
                        ),
                        subtitle: Text(
                          _announcements[index].description,
                          style: const TextStyle(
                            color: Colors
                                .white, // Set description text color to white
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
