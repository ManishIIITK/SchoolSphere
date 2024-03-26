import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/teachers/Time_Table_Screen/data/teachers_time_table_data.dart';

class TeachersTimeTableScreen extends StatelessWidget {
  static const routeName = 'TeachersTimeTableScreen';

  const TeachersTimeTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable'),
        backgroundColor: kPrimaryColor,
      ),
      backgroundColor: kOtherColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the days at the top with app's primary color
            Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                border: Border.all(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  for (var day in TeachersTimeTableData[0])
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            day,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white, // Set text color to white
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Display the timetable in a tabular structure
            Expanded(
              child: ListView.builder(
                itemCount:
                    TeachersTimeTableData.length - 1, // Exclude the first row
                itemBuilder: (context, rowIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        // Display time in the first column with primary color background
                        Container(
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            border: Border.all(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          width: 60,
                          // color: kPrimaryColor,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                TeachersTimeTableData[rowIndex + 1][0],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: kOtherColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Display class names in the remaining columns
                        for (var colIndex = 1;
                            colIndex <
                                TeachersTimeTableData[rowIndex + 1].length;
                            colIndex++)
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: kPrimaryColor.withOpacity(0.1),
                                border: Border.all(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  TeachersTimeTableData[rowIndex + 1][colIndex],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: kTextBlackColor, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
