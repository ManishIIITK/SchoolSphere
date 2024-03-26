import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/students/doubt_screen/data/chat_data.dart';
import 'package:school_management_app/screens/students/doubt_screen/model/chat_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_management_app/screens/students/doubt_screen/model/teacher_model.dart';
// Import the image_picker package

class StudentChatScreen extends StatefulWidget {
  final Teacher teacher;

  const StudentChatScreen({super.key, required this.teacher});

  static const routeName = 'StudentChatScreen';

  @override
  State<StudentChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<StudentChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  List<PlatformFile> _selectedFiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOtherColor,
      appBar: AppBar(
        title: Text(widget.teacher.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                final message = chatMessages[index];
                return MessageWidget(message: message);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                    style: TextStyle(
                      color: kTextBlackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: _showFilePickerDialog,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    // Handle sending the message here
                  },
                ),
              ],
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
                child: const Text(
                  'Media Files',
                  style: TextStyle(color: kTextBlackColor),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  _takePicture();
                },
                child: const Text(
                  'Take a Picture',
                  style: TextStyle(color: kTextBlackColor),
                ),
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

  void _sendMessage(String text, List<PlatformFile>? mediaFiles) {
    // Handle sending the message and media files here
    // You can use the 'text' and 'mediaFiles' for sending the message and media content
    // Reset the message controller and selected files after sending
    _messageController.clear();
    setState(() {
      _selectedFiles = [];
    });
  }
}

class MessageWidget extends StatelessWidget {
  final Message message;

  const MessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final alignment =
        message.isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final bgColor = message.isSender ? Colors.blue : Colors.grey;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.7,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    message.text,
                    style:
                        const TextStyle(fontSize: 16, color: kTextBlackColor),
                  ),
                ), // Check if the message is delivered
                // const Icon(
                //   Icons.check_box, // You can use any icon you prefer
                //   color: kOtherColor,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
