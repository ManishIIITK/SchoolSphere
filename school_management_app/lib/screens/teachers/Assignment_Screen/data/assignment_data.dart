// assignment_data.dart

import 'package:school_management_app/screens/teachers/Assignment_Screen/model/teacher_assignment_model.dart';

List<AssignmentData> teacherAssignment = [
  AssignmentData(
    'Maths',
    'Assignment 4',
    '17 April 2017',
    '26 April 2017',
    'Math assignment description...',
    'In Progress',
    ['math_assignment.pdf', 'math_notes.doc'],
    ['Comment 1', 'Comment 2'],
    [
      'Student A',
      'Student B'
    ], // List of students who have submitted the assignment
  ),
];
