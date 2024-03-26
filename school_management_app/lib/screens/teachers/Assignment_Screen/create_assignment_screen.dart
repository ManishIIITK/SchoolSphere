// teachers_post_assignment_screen.dart
import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';

class TeachersPostAssignmentScreen extends StatefulWidget {
  static const routeName = 'TeachersPostAssignmentScreen';

  const TeachersPostAssignmentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TeachersPostAssignmentScreenState createState() =>
      _TeachersPostAssignmentScreenState();
}

class _TeachersPostAssignmentScreenState
    extends State<TeachersPostAssignmentScreen> {
  final TextEditingController _subjectNameController = TextEditingController();
  final TextEditingController _assignmentNumberController =
      TextEditingController();
  final TextEditingController _lastDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Assignment'),
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
          padding: const EdgeInsets.all(kDefaultPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _subjectNameController,
                  decoration: const InputDecoration(labelText: 'Subject Name'),
                  style: const TextStyle(
                      color: kTextBlackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: kDefaultPadding),
                TextField(
                  controller: _assignmentNumberController,
                  decoration:
                      const InputDecoration(labelText: 'Assignment Number'),
                  style: const TextStyle(
                      color: kTextBlackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: kDefaultPadding),
                TextField(
                  controller: _lastDateController,
                  decoration: const InputDecoration(labelText: 'Last Date'),
                  style: const TextStyle(
                      color: kTextBlackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: kDefaultPadding),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  style: const TextStyle(
                      color: kTextBlackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: kDefaultPadding),
                const SizedBox(height: kDefaultPadding * 2),
                ElevatedButton(
                  onPressed: () {
                    // Handle the button press to post the assignment details
                    // String subjectName = _subjectNameController.text;
                    // String assignmentNumber = _assignmentNumberController.text;
                    // String lastDate = _lastDateController.text;
                    // String description = _descriptionController.text;
                    // You can handle attachments here

                    // TODO: Implement logic to post assignment details (e.g., API call or database insertion)

                    // Show a success message or navigate back
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Assignment posted successfully!'),
                      ),
                    );
                    // Navigate back to the previous screen or perform any other navigation logic
                    Navigator.pop(context);
                  },
                  child: const Text('Post Assignment'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
