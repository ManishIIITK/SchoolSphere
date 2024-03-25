import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/students/assignment_screen/data/assignment_data.dart';
import 'package:school_management_app/screens/students/assignment_screen/widgets/assignment_widgets.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({super.key});

  static const routeName = 'AssignmentScreen';

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  List<PlatformFile> _selectedFiles = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignments"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: kOtherColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding),
                  topRight: Radius.circular(kDefaultPadding),
                ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(kDefaultPadding),
                itemCount: studentAssignment.length,
                itemBuilder: (context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: kDefaultPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(kDefaultPadding),
                            color: kOtherColor,
                            boxShadow: const [
                              BoxShadow(
                                color: kTextLightColor,
                                blurRadius: 2.0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: kSecondaryColor.withOpacity(0.4),
                                  borderRadius:
                                      BorderRadius.circular(kDefaultPadding),
                                ),
                                child: Center(
                                  child: Text(
                                    studentAssignment[index].subjectName,
                                    style: const TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w400,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              kHalfSizedBox,
                              Text(
                                studentAssignment[index].assignmentNumber,
                                style: const TextStyle(
                                    color: kTextBlackColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0),
                              ),
                              kHalfSizedBox,
                              AssingmentDetailsRow(
                                title: 'Assign Date',
                                statusValue: studentAssignment[index].assignedDate,
                              ),
                              kHalfSizedBox,
                              AssingmentDetailsRow(
                                title: 'Last Date',
                                statusValue: studentAssignment[index].lastDate,
                              ),
                              kHalfSizedBox,
                              AssingmentDetailsRow(
                                title: 'Status',
                                statusValue: studentAssignment[index].status,
                              ),
                              kHalfSizedBox,
                              if (studentAssignment[index].status == "Pending")
                                AssignmentButton(
                                  title: "Add File",
                                  onPress: _showFilePickerDialog,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showFilePickerDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Choose an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  _pickMediaFiles();
                },
                child: const Text('Media Files',style: TextStyle(color: kTextBlackColor)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  _takePicture();
                },
                child: const Text('Take a Picture',style: TextStyle(color: kTextBlackColor)),
              ),
            ],
          ),
        );
      },
    );
  }

  void _pickMediaFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf', 'doc'],
    );

    if (result != null) {
      setState(() {
        _selectedFiles = result.files;
      });
    }
  }

  void _takePicture() async {
    PermissionStatus status = await Permission.camera.request();

    if (status.isGranted) {
      final XFile? pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        int fileSize = await imageFile.length();

        setState(() {
          // Add the picked image file to the _selectedFiles list
          _selectedFiles.add(PlatformFile(
            name: pickedFile.name,
            path: pickedFile.path,
            size: fileSize,
          ));
        });
      }
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Permission Required'),
            content: const Text(
              'To take a picture, please grant camera access in your device settings.',
              style: TextStyle(color: kTextBlackColor, fontSize: 14),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
