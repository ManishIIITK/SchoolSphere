import 'package:flutter/material.dart';
import 'package:school_management_app/components/custom_button.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/admin/Announcement_Screen/data/admin_post_data.dart';
import 'package:school_management_app/screens/admin/Announcement_Screen/model/admin_post_model.dart';

class AdminAnnouncementScreen extends StatefulWidget {
  const AdminAnnouncementScreen({Key? key}) : super(key: key);

  static const routeName = 'AdminAnnouncementScreen';

  @override
  _AdminAnnouncementScreenState createState() =>
      _AdminAnnouncementScreenState();
}

class _AdminAnnouncementScreenState extends State<AdminAnnouncementScreen> {
  final TextEditingController _announcementController = TextEditingController();
  final List<AdminPost> _announcements =
      dummyPosts; // Initialize with dummy data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Announcement'),
        backgroundColor: kPrimaryColor, // Set primary color to blue
      ),
      body: Container(
        color: kOtherColor, // Set the background color to white
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
              CustomButton(
                  onPress: () {
                    // Simulate posting an announcement
                    String announcementText = _announcementController.text;
                    // Create a new post and add it to the list (simulating a database)
                    _announcements.add(AdminPost(
                      dateTime: DateTime.now(), // Use the current date and time
                      description: announcementText,
                    ));
                    // Clear the text field after posting
                    _announcementController.clear();
                  },
                  title: "Post Announcement",
                  iconData: Icons.post_add),
              const SizedBox(height: 20),
              // Second half: Display Announcements
              Expanded(
                child: ListView.builder(
                  itemCount: _announcements.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [kSecondaryColor, TPrimaryColor],
                              begin: FractionalOffset(0.0, 0.0),
                              end: FractionalOffset(0.5, 0.0),
                              stops: [0.0, 1.1],
                              tileMode: TileMode.clamp),
                          // borderRadius: BorderRadius.circular(kDefaultPadding),
                        ),
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
