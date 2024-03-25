// assignment_model.dart

class AssignmentData {
  final String subjectName;
  final String assignmentNumber;
  final String assignedDate;
  final String lastDate;
  final String description;
  final String status;
  final List<String> attachments;
  final List<String> comments;
  final List<String> submittedStudents; // New field to store submitted student names

  AssignmentData(
    this.subjectName,
    this.assignmentNumber,
    this.assignedDate,
    this.lastDate,
    this.description,
    this.status,
    this.attachments,
    this.comments,
    this.submittedStudents, // Initialize the list of submitted students
  );
}
