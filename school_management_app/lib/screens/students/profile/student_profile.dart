import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  static String routeName = 'StudentProfileScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        // centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(right: kDefaultPadding / 2),
              child: Row(
                children: [
                  const Icon(Icons.report_gmailerrorred_outlined),
                  kHalfWidthSizedBox,
                  Text(
                    'Report',
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: kOtherColor,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(kDefaultPadding * 2),
                  bottomLeft: Radius.circular(kDefaultPadding * 2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    maxRadius: 50.0,
                    minRadius: 50.0,
                    backgroundColor: kSecondaryColor,
                    backgroundImage:
                        AssetImage('assets/images/student_profile.png'),
                  ),
                  kWidthSizedBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Manish Kumar',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Class - X-II A | Roll no: 573',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 14.0),
                      ),
                    ],
                  )
                ],
              ),
            ),
            sizedBox,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileDetailRow(
                    title: "Regestration Number", value: "CSE/20053/573"),
                ProfileDetailRow(title: "Academic Year", value: "2020-2024")
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileDetailRow(title: "Class", value: "X-II"),
                ProfileDetailRow(title: "Admission Number", value: "2020-2024")
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileDetailRow(
                    title: "Date of Admission", value: "04/11/2020"),
                ProfileDetailRow(title: "Date of Birth", value: "05/12/2001")
              ],
            ),
            kHalfSizedBox,
            const PersonalDetails(
              title: "Email",
              value: "manish20573@iiitkalyani.ac.in",
            ),
            const PersonalDetails(
              title: "Father Name",
              value: "Ram Prasad Mandal",
            ),
            const PersonalDetails(
              title: "Mother Name",
              value: "Mina Devi",
            ),
            const PersonalDetails(
              title: "Phone Number",
              value: "+919931716580",
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          right: kDefaultPadding / 4,
          left: kDefaultPadding / 4,
          top: kDefaultPadding / 2),
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: kTextLightColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0),
              ),
              kHalfSizedBox,
              Text(
                value,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: kTextBlackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0),
              ),
              kHalfSizedBox,
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: const Divider(
                  thickness: 1.0,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.lock_outline,
            size: 20.0,
          ),
        ],
      ),
    );
  }
}

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 7, right: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: kTextLightColor,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600),
              ),
              kHalfSizedBox,
              Text(
                value,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: kTextBlackColor,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600),
              ),
              kHalfSizedBox,
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: const Divider(
                  thickness: 1.0,
                ),
              )
            ],
          ),
          const Icon(
            Icons.lock_outline,
            size: 20.0,
          ),
        ],
      ),
    );
  }
}
