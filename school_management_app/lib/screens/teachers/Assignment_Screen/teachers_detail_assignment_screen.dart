import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/teachers/Assignment_Screen/model/teacher_assignment_model.dart';

class TeachersDetailedAssignmentScreen extends StatelessWidget {
  final AssignmentData assignmentData;

  const TeachersDetailedAssignmentScreen({
    Key? key,
    required this.assignmentData,
  }) : super(key: key);

  static const String routeName = 'TeachersDetailedAssignmentScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment Details'),
        centerTitle: true,
      ),
      backgroundColor: kOtherColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // First half of the screen
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Subject: ${assignmentData.subjectName}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kTextBlackColor
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Assignment Number: ${assignmentData.assignmentNumber}',
                        style: const TextStyle(fontSize: 16,color: kTextBlackColor),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Assigned Date: ${assignmentData.assignedDate}',
                        style: const TextStyle(fontSize: 16,color: kTextBlackColor),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Last Date: ${assignmentData.lastDate}',
                        style: const TextStyle(fontSize: 16,color: kTextBlackColor),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Description: ${assignmentData.description}',
                        style: const TextStyle(fontSize: 16,color: kTextBlackColor),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Status: ${assignmentData.status}',
                        style: const TextStyle(fontSize: 16,color: kTextBlackColor),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to a screen to see the list of students who have submitted
                          // and who have not submitted the assignment.
                        },
                        child: const Text('View Student List'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              // Second half of the screen
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Attachments:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kTextBlackColor
                        ),
                      ),
                      Column(
                        children: assignmentData.attachments
                            .map(
                              (attachment) => Text(
                                attachment,
                                style: const TextStyle(fontSize: 16,color: kTextBlackColor),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Comments:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kTextBlackColor
                      ),
                    ),
                    Column(
                      children: assignmentData.comments
                          .map(
                            (comment) => Text(
                              comment,
                              style: const TextStyle(fontSize: 16,color: kTextBlackColor),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
