import 'package:flutter/material.dart';
import 'package:school_management_app/screens/admin/Admin_Profile_Screen/admin_profile_screen.dart';
import 'package:school_management_app/screens/admin/Announcement_Screen/admin_announcement_screen.dart';
import 'package:school_management_app/screens/admin/Holiday_Screen/holiday_screen.dart';
import 'package:school_management_app/screens/admin/Home_Screen/admin_home_screen.dart';
import 'package:school_management_app/screens/admin/Student_Screen/admin_add_student_screen.dart';
import 'package:school_management_app/screens/admin/Student_Screen/admin_student_screen.dart';
import 'package:school_management_app/screens/admin/Teacher_Screen/admin_teacher_screen.dart';
import 'package:school_management_app/screens/signup_screen/SignUp_Screen.dart';
import 'package:school_management_app/screens/signup_screen/sign_up_student.dart';
import 'package:school_management_app/screens/signup_screen/sign_up_teacher.dart';
import 'package:school_management_app/screens/students/announcement_screen/view_announcement_screen.dart';
import 'package:school_management_app/screens/students/assignment_screen/assignment_screen.dart';
import 'package:school_management_app/screens/students/attendance/attendance.dart';
import 'package:school_management_app/screens/students/doubt_screen/student_chat_screen.dart';
import 'package:school_management_app/screens/students/doubt_screen/data/teacher_data.dart';
import 'package:school_management_app/screens/students/doubt_screen/student_chat_home_screen.dart';
import 'package:school_management_app/screens/students/event_screen/event_screen.dart';
import 'package:school_management_app/screens/students/fee_screen/fee_screen.dart';
import 'package:school_management_app/screens/students/gallery_screen/gallery_screen.dart';
import 'package:school_management_app/screens/students/holidays_screen/holiday_screen.dart';
import 'package:school_management_app/screens/students/home_screen/home_screen.dart';
import 'package:school_management_app/screens/login_screen/login_screen.dart';
import 'package:school_management_app/screens/students/marks_screen/data/post_data.dart';
import 'package:school_management_app/screens/students/marks_screen/marks_post_details_screen.dart';
import 'package:school_management_app/screens/students/marks_screen/marks_post_screen.dart';
import 'package:school_management_app/screens/students/profile/student_profile.dart';
import 'package:school_management_app/screens/students/result_screen/result_screen.dart';
import 'package:school_management_app/screens/splash_screen/splash_screen.dart';
import 'package:school_management_app/screens/students/time_table_screen/students_time_table_screen.dart';
import 'package:school_management_app/screens/teachers/Announcement_Screen/teachers_announcement_screen.dart';
import 'package:school_management_app/screens/teachers/Assignment_Screen/create_assignment_screen.dart';
import 'package:school_management_app/screens/teachers/Assignment_Screen/data/assignment_data.dart';

///////////////////////////////
import 'package:school_management_app/screens/teachers/Assignment_Screen/teachers_assignment_screen.dart';
import 'package:school_management_app/screens/teachers/Assignment_Screen/teachers_detail_assignment_screen.dart';
import 'package:school_management_app/screens/teachers/Attendance_Screen/teacher_attendance.dart';
import 'package:school_management_app/screens/teachers/Chat_Screen/chat_home_screen.dart';
import 'package:school_management_app/screens/teachers/Chat_Screen/chat_screen.dart';
import 'package:school_management_app/screens/teachers/Chat_Screen/data/student_data.dart';
import 'package:school_management_app/screens/teachers/Holiday_Screen/holiday_screen.dart';
import 'package:school_management_app/screens/teachers/Home_Screen/home_screen.dart';
import 'package:school_management_app/screens/teachers/Salary_Screen/data/salary_data.dart';
import 'package:school_management_app/screens/teachers/Salary_Screen/detail_salary_screen.dart';
import 'package:school_management_app/screens/teachers/Salary_Screen/salary_screen.dart';
import 'package:school_management_app/screens/teachers/Teachers_Profile_Screen/teacher_profile.dart';
import 'package:school_management_app/screens/teachers/Time_Table_Screen/teachers_time_table_screen.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),

  // Admin Routes
  AdminHomeScreen.routeName: (context) => const AdminHomeScreen(),
  AdminProfileScreen.routeName: (context) => const AdminProfileScreen(),
  AdminAnnouncementScreen.routeName: (context) =>
      const AdminAnnouncementScreen(),
  AdminHolidayScreen.routeName: (context) => const AdminHolidayScreen(),
  AdminStudentScreen.routeName: (context) => const AdminStudentScreen(),
  AdminTeacherScreen.routeName: (context) => const AdminTeacherScreen(),
  AdminAddStudentScreen.routeName: (context) => AdminAddStudentScreen(),

  // Students Route
  StudentHomeScreen.routeName: (context) => const StudentHomeScreen(),
  StudentProfileScreen.routeName: (context) => const StudentProfileScreen(),
  FeeScreen.routeName: (context) => const FeeScreen(),
  AssignmentScreen.routeName: (context) => const AssignmentScreen(),
  StudentAttendaceScreen.routeName: (context) => const StudentAttendaceScreen(),
  StudentChatScreen.routeName: (context) =>
      StudentChatScreen(teacher: teachers[0]),
  TeachersListScreen.routeName: (context) => const TeachersListScreen(),
  HolidayScreen.routeName: (context) => const HolidayScreen(),
  ResultScreen.routeName: (context) => const ResultScreen(),
  EventScreen.routeName: (context) => const EventScreen(),
  StudentsTimeTableScreen.routeName: (context) =>
      const StudentsTimeTableScreen(),
  GalleryScreen.routeName: (context) => const GalleryScreen(),
  StudentsAnnouncementScreen.routeName: (context) =>
      const StudentsAnnouncementScreen(),
  MarksPostScreen.routeName: (context) => MarksPostScreen(),
  MarksPostDetailScreen.routeName: (context) =>
      MarksPostDetailScreen(post: getPostsData()[0]),

  // Teachers Route
  TeacherHomeScreen.routeName: (context) => const TeacherHomeScreen(),
  TeachersAssignmentScreen.routeName: (context) =>
      const TeachersAssignmentScreen(),
  TeachersDetailedAssignmentScreen.routeName: (context) =>
      TeachersDetailedAssignmentScreen(assignmentData: teacherAssignment[0]),
  TeacherProfileScreen.routeName: (context) => const TeacherProfileScreen(),
  TeacherAttendanceScreen.routeName: (context) =>
      const TeacherAttendanceScreen(),
  SalaryScreen.routeName: (context) => const SalaryScreen(),
  ChatHomeScreen.routeName: (context) => const ChatHomeScreen(),
  TeachersChatScreen.routeName: (context) =>
      TeachersChatScreen(student: students[0]),
  TeachersHolidayScreen.routeName: (context) => const TeachersHolidayScreen(),
  DetailedSalaryScreen.routeName: (context) =>
      DetailedSalaryScreen(salaryData: salary[0]),
  TeacherAnnouncementScreen.routeName: (context) =>
      const TeacherAnnouncementScreen(),
  TeachersTimeTableScreen.routeName: (context) =>
      const TeachersTimeTableScreen(),
  TeachersPostAssignmentScreen.routeName: (context) =>
      const TeachersPostAssignmentScreen(),

  /////////////////// common
  SignUpScreen.routeName: (context) => SignUpScreen(),
  SignUpAsTeacher.routeName: (context) => SignUpAsTeacher(),
  SignUpAsStudent.routeName: (context) => SignUpAsStudent(),
};
