import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/teachers/Chat_Screen/chat_screen.dart';
import 'package:school_management_app/screens/teachers/Chat_Screen/data/student_data.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});
  static const routeName = 'ChatHomeScreen';

  @override
  // ignore: library_private_types_in_public_api
  _ChatHomeScreenState createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doubt Section'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(),
                color: kOtherColor,
              ),
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return Card(
                    elevation: 0,
                    color: kOtherColor,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(student.profilePicture),
                      ),
                      title: Text(
                        student.name,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      trailing: const Icon(
                        Icons.chat,
                        color: kPrimaryColor,
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                            context, TeachersChatScreen.routeName,
                            arguments: student);
                      },
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
}
