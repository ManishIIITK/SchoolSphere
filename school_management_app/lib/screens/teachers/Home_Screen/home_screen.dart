import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/login_screen/login_screen.dart';
import 'package:school_management_app/screens/teachers/Announcement_Screen/teachers_announcement_screen.dart';
import 'package:school_management_app/screens/teachers/Assignment_Screen/teachers_assignment_screen.dart';
import 'package:school_management_app/screens/teachers/Attendance_Screen/teacher_attendance.dart';
import 'package:school_management_app/screens/teachers/Chat_Screen/chat_home_screen.dart';
import 'package:school_management_app/screens/teachers/Holiday_Screen/holiday_screen.dart';
import 'package:school_management_app/screens/teachers/Home_Screen/widgets/teacher_data.dart';
import 'package:school_management_app/screens/teachers/Salary_Screen/salary_screen.dart';
import 'package:school_management_app/screens/teachers/Teachers_Profile_Screen/teacher_profile.dart';
import 'package:school_management_app/screens/teachers/Time_Table_Screen/teachers_time_table_screen.dart';

class TeacherHomeScreen extends StatefulWidget {
  const TeacherHomeScreen({super.key});
  static const routeName = 'TeacherHomeScreen';

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
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
                        TeacherName(teacherName: "Bhaskar Biswas"),
                      ],
                    ),
                    kHalfSizedBox,
                    TeacherPicture(
                        picLocation: 'assets/images/teachers/bbmain.jpg',
                        onPress: () {
                          Navigator.pushNamed(
                              context, TeacherProfileScreen.routeName);
                        }),
                  ],
                ),
                sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TeacherDataCard(
                        title: "View Attendance",
                        // value: "90.2%",
                        onPress: () {
                          Navigator.pushNamed(
                              context, TeacherAttendanceScreen.routeName);
                        }),
                    TeacherDataCard(
                      title: " View Salary",
                      // value: "Rs 6000",
                      onPress: () {
                        Navigator.pushNamed(context, SalaryScreen.routeName);
                      },
                    ),
                  ],
                )
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
                            // Navigator.pushNamed(context,
                            //     TeachersAssignedClassesScreen.routeName);
                          },
                          icon: 'assets/icons/students.svg',
                          title: 'Students',
                        ),
                        HomeCard(
                          onPress: () {
                            Navigator.pushNamed(
                                context, TeacherAnnouncementScreen.routeName);
                          },
                          icon: 'assets/icons/announcement.svg',
                          title: 'Announcement',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {
                            Navigator.pushNamed(
                                context, ChatHomeScreen.routeName);
                          },
                          icon: 'assets/icons/ask.svg',
                          title: 'Douts',
                        ),
                        HomeCard(
                          onPress: () {
                            Navigator.pushNamed(
                                context, TeachersAssignmentScreen.routeName);
                          },
                          icon: 'assets/icons/assignment.svg',
                          title: 'Assignemnts',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {
                            Navigator.pushNamed(
                                context, TeachersHolidayScreen.routeName);
                          },
                          icon: 'assets/icons/holiday.svg',
                          title: 'Holidays',
                        ),
                        HomeCard(
                          onPress: () {
                            Navigator.pushNamed(
                                context, TeachersTimeTableScreen.routeName);
                          },
                          icon: 'assets/icons/timetable.svg',
                          title: 'Time Table',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/lock.svg',
                          title: 'Change Password',
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
