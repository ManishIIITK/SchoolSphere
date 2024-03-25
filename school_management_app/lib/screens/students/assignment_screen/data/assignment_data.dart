class AssignmentData {
  final String subjectName;
  final String assignmentNumber;
  final String assignedDate;
  final String lastDate;
  final String status;

  AssignmentData(this.subjectName, this.assignmentNumber, this.assignedDate,
      this.lastDate, this.status);
}

List<AssignmentData> studentAssignment = [
  AssignmentData(
      'Maths', 'Assignent 4', '17 April 2017', '26 April 2017', 'Pending'),
  AssignmentData(
      'Science', 'Assignent 3', '5 April 2017', '7 April 2017', 'Submitted'),
  AssignmentData(
      'Maths', 'Assignent 3', '5 April 2017', '8 April 2017', 'Submitted'),
  AssignmentData('Polity', 'Assignent 2', '22 April 2017', '23 April 2017',
      'Not Submitted'),
];
