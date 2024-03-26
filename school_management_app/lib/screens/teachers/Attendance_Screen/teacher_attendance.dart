import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/teachers/Attendance_Screen/data/attendance_data.dart';

class TeacherAttendanceScreen extends StatefulWidget {
  const TeacherAttendanceScreen({super.key});
  static const routeName = 'TeacherAttendanceScreen';

  @override
  _TeacherAttendanceScreenState createState() =>
      _TeacherAttendanceScreenState();
}

class _TeacherAttendanceScreenState extends State<TeacherAttendanceScreen> {
  List<Map<String, dynamic>> attendanceData = [];

  @override
  void initState() {
    super.initState();
    // Load attendance data from the data file when the screen is initialized.
    attendanceData = AttendanceData.getTeacherAttendanceData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding),
                  topRight: Radius.circular(kDefaultPadding),
                ),
                color: kOtherColor,
              ),
              child: ListView.builder(
                itemCount: attendanceData.length,
                itemBuilder: (context, index) {
                  final attendanceRecord = attendanceData[index];
                  return ListTile(
                    title: Text(
                      "${attendanceRecord['date']}",
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    trailing: Text(
                      " ${attendanceRecord['status']}",
                      style: TextStyle(
                          color: attendanceRecord['status'] == 'Present'
                              ? Colors.green
                              : Colors.red,
                          fontSize: 16),
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
