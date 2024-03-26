import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/admin/Admin_Profile_Screen/admin_profile_screen.dart';
import 'package:school_management_app/screens/admin/Announcement_Screen/admin_announcement_screen.dart';
import 'package:school_management_app/screens/admin/Holiday_Screen/holiday_screen.dart';
import 'package:school_management_app/screens/admin/Home_Screen/widgets/admin_data.dart';
import 'package:school_management_app/screens/admin/Student_Screen/admin_student_screen.dart';
import 'package:school_management_app/screens/admin/Teacher_Screen/admin_teacher_screen.dart';
import 'package:school_management_app/screens/login_screen/login_screen.dart';
// import 'package:school_management_app/screens/teachers/Announcement_Screen/teachers_announcement_screen.dart';
// import 'package:school_management_app/screens/teachers/Assignment_Screen/teachers_assignment_screen.dart';
// import 'package:school_management_app/screens/teachers/Attendance_Screen/teacher_attendance.dart';
// import 'package:school_management_app/screens/teachers/Chat_Screen/chat_home_screen.dart';
// import 'package:school_management_app/screens/teachers/Holiday_Screen/holiday_screen.dart';
// import 'package:school_management_app/screens/teachers/Salary_Screen/salary_screen.dart';
// import 'package:school_management_app/screens/teachers/Teachers_Profile_Screen/teacher_profile.dart';
// import 'package:school_management_app/screens/teachers/Time_Table_Screen/teachers_time_table_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});
  static const routeName = 'AdminHomeScreen';

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: kDefaultPadding),
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AdminName(adminName: "Admin Admin"),
                      ],
                    ),
                    kHalfSizedBox,
                    AdminPicture(
                        picLocation: 'assets/images/admin/dp.png',
                        onPress: () {
                          Navigator.pushNamed(
                              context, AdminProfileScreen.routeName);
                        }),
                  ],
                ),
                // sizedBox,
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     AdminDataCard(
                //         title: "View Attendance",
                //         // value: "90.2%",
                //         onPress: () {
                //           Navigator.pushNamed(
                //               context, TeacherAttendanceScreen.routeName);
                //         }),
                //     AdminDataCard(
                //       title: " View Salary",
                //       // value: "Rs 6000",
                //       onPress: () {
                //         Navigator.pushNamed(context, SalaryScreen.routeName);
                //       },
                //     ),
                //   ],
                // )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: kOtherColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 3),
                    topRight: Radius.circular(kDefaultPadding * 3),
                  ),
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {
                            Navigator.pushNamed(
                                context, AdminStudentScreen.routeName);
                          },
                          icon: 'assets/icons/students.svg',
                          title: 'Students',
                        ),
                        HomeCard(
                          onPress: () {
                            Navigator.pushNamed(
                                context, AdminTeacherScreen.routeName);
                          },
                          icon: 'assets/icons/teacher.svg',
                          title: 'Teacher',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {
                            Navigator.pushNamed(
                                context, AdminAnnouncementScreen.routeName);
                          },
                          icon: 'assets/icons/announcement.svg',
                          title: 'Announcement',
                        ),
                        HomeCard(
                          onPress: () {
                            Navigator.pushNamed(
                                context, AdminHolidayScreen.routeName);
                          },
                          icon: 'assets/icons/holiday.svg',
                          title: 'Holidays',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/timetable.svg',
                          title: 'Modify Time Table',
                        ),
                        HomeCard(
                          onPress: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              LoginScreen.routeName,
                              (Route<dynamic> route) => false,
                            );
                          },
                          icon: 'assets/icons/logout.svg',
                          title: 'Logout',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard(
      {super.key,
      required this.onPress,
      required this.icon,
      required this.title});

  final VoidCallback onPress;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(top: kDefaultPadding / 2),
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                height: 40,
                width: 40,
                // ignore: deprecated_member_use
                color: kOtherColor,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: kDefaultPadding / 3,
              )
            ]),
      ),
    );
  }
}
