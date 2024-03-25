import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/students/holidays_screen/data/holiday_model.dart';

class TeachersHolidayScreen extends StatelessWidget {
  const TeachersHolidayScreen({super.key});

  static const routeName = 'TeachersTeachersHolidayScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Holidays'),
        centerTitle: true,
      ),
      backgroundColor: kOtherColor,
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kDefaultPadding),
                topRight: Radius.circular(kDefaultPadding),
              ),
              color: kOtherColor,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Expanded(
                child: DataTable(
                  columns: const [
                    DataColumn(
                      label: Text(
                        'Occasion',
                        style: TextStyle(
                            color: kTextBlackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Date',
                        style: TextStyle(
                            color: kTextBlackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Day',
                        style: TextStyle(
                            color: kTextBlackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: const [], // Leave the rows empty
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: holidays
                  .map(
                    (holiday) => Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 165, // Adjust the flex value for column width
                            child: Text(
                              holiday.occasion,
                              style: const TextStyle(
                                color: kTextBlackColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 135, // Adjust the flex value for column width
                            child: Text(
                              '${holiday.date.day}/${holiday.date.month}/${holiday.date.year}',
                              style: const TextStyle(
                                color: kTextBlackColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 100, // Adjust the flex value for column width
                            child: Text(
                              holiday.day,
                              style: const TextStyle(
                                color: kTextBlackColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
