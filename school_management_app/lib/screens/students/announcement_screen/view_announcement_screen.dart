import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/students/announcement_screen/data/annoucement_data.dart';
import 'package:school_management_app/screens/students/announcement_screen/model/announcement_model.dart';

class StudentsAnnouncementScreen extends StatelessWidget {
  static const routeName = 'StudentsAnnouncementScreen';

  const StudentsAnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sort announcements by date and time in descending order
    dummyAnnouncements.sort((a, b) => b.dateTime.compareTo(a.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcements'),
        backgroundColor: kPrimaryColor,
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
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          child: ListView.builder(
            itemCount: dummyAnnouncements.length,
            itemBuilder: (context, index) {
              Announcement announcement = dummyAnnouncements[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15.0), // Set border radius
                ),
                color: kPrimaryColor.withOpacity(0.5),
                child: ListTile(
                  title: Text(
                    'Announcer: ${announcement.announcerName}',
                    style: const TextStyle(
                      color: kTextBlackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date: ${announcement.date}',
                        style: const TextStyle(
                          color: kTextBlackColor,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Time: ${announcement.time}',
                        style: const TextStyle(
                          color: kTextBlackColor,
                          fontSize: 16,
                        ),
                      ),
                      kHalfSizedBox,
                      Text(
                        'Description: ${announcement.description}',
                        style: const TextStyle(
                          color: kTextBlackColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
