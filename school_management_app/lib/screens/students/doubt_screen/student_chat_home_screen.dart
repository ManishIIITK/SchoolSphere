import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/students/doubt_screen/student_chat_screen.dart';
import 'package:school_management_app/screens/students/doubt_screen/data/teacher_data.dart';

class TeachersListScreen extends StatefulWidget {
  const TeachersListScreen({super.key});
  static const routeName = 'TeachersListScreen';

  @override
  // ignore: library_private_types_in_public_api
  _TeachersListScreenState createState() => _TeachersListScreenState();
}

class _TeachersListScreenState extends State<TeachersListScreen> {
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
                itemCount: teachers.length,
                itemBuilder: (context, index) {
                  final teacher = teachers[index];
                  return Card(
                    elevation: 0,
                    color: kOtherColor,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(teacher.profilePicture),
                      ),
                      title: Text(
                        teacher.name,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      trailing: const Icon(Icons.chat, color: kPrimaryColor,),
                      onTap: () {
                        Navigator.pushNamed(context, StudentChatScreen.routeName,
                            arguments: teacher);
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
