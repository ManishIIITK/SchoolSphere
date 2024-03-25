// timetable_screen.dart

import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/students/time_table_screen/data/students_time_table_model.dart';

class StudentsTimeTableScreen extends StatelessWidget {
  const StudentsTimeTableScreen({Key? key}) : super(key: key);

  static const routeName = 'StudentsTimeTableScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable'),
        centerTitle: true,
      ),
      backgroundColor: kOtherColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Table(
            border: TableBorder.all(color: kPrimaryColor, width: 1.0),
            children: <TableRow>[
              _buildTableHeaderRow(['Time', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri']),
              for (var entry in timetableData)
                _buildTableRow([entry.time, ...entry.days]),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableHeaderRow(List<String> headers) {
    return TableRow(
      children: headers.map((header) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            border: Border.all(color: kPrimaryColor, width: 1.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Text(
            header,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        );
      }).toList(),
    );
  }

  TableRow _buildTableRow(List<String> cells) {
    return TableRow(
      children: cells.asMap().entries.map((entry) {
        int index = entry.key;
        String cell = entry.value;
        Color textColor = kTextBlackColor;

        if (index > 0 && cell == "Math") {
          textColor = Colors.red;
        }
        if (index > 0 && cell == "Science") {
          textColor = Colors.green;
        }
        if (index > 0 && cell == "English") {
          textColor = Colors.red;
        }
        if (index > 0 && cell == "History") {
          textColor = Colors.yellow.shade800;
        }
        if (index > 0 && cell == "Gym") {
          textColor = Colors.blue;
        }

        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cell,
            style: TextStyle(color: textColor, fontSize: 14),
          ),
        );
      }).toList(),
    );
  }
}
