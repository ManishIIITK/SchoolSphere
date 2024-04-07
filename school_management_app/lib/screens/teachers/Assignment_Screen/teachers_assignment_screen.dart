import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/teachers/Assignment_Screen/create_assignment_screen.dart';
import 'package:school_management_app/screens/teachers/Assignment_Screen/data/assignment_data.dart';
import 'package:school_management_app/screens/teachers/Assignment_Screen/teachers_detail_assignment_screen.dart';
import 'package:school_management_app/screens/teachers/Assignment_Screen/widgets/assignment_widgets.dart';

class TeachersAssignmentScreen extends StatefulWidget {
  const TeachersAssignmentScreen({super.key});

  static const routeName = 'TeachersAssignmentScreen';

  @override
  State<TeachersAssignmentScreen> createState() =>
      _TeachersAssignmentScreenState();
}

class _TeachersAssignmentScreenState extends State<TeachersAssignmentScreen> {
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
                itemCount: teacherAssignment.length,
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
                                    teacherAssignment[index].subjectName,
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
                                teacherAssignment[index].assignmentNumber,
                                style: const TextStyle(
                                    color: kTextBlackColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0),
                              ),
                              kHalfSizedBox,
                              AssingmentDetailsRow(
                                title: 'Assign Date',
                                statusValue:
                                    teacherAssignment[index].assignedDate,
                              ),
                              kHalfSizedBox,
                              AssingmentDetailsRow(
                                title: 'Last Date',
                                statusValue: teacherAssignment[index].lastDate,
                              ),
                              kHalfSizedBox,
                              AssignmentButton(
                                  title: "View",
                                  onPress: () {
                                    Navigator.pushNamed(
                                        context,
                                        TeachersDetailedAssignmentScreen
                                            .routeName,
                                        arguments: teacherAssignment);
                                  }),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, TeachersPostAssignmentScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
