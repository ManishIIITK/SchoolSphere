import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';

class TeacherProfileScreen extends StatelessWidget {
  const TeacherProfileScreen({super.key});

  static String routeName = 'TeacherProfileScreen';

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
              height: 120,
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
                        AssetImage('assets/images/teachers/bbmain.jpg'),
                  ),
                  kWidthSizedBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bhaskar Biswas',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Employee Id: 573',
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
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     ProfileDetailRow(
            //         title: "Employee Id", value: "CSE/20053/573"),
            //     ProfileDetailRow(title: "", value: "2020-2024")
            //   ],
            // ),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     ProfileDetailRow(
            //         title: "Date of Admission", value: "04/11/2020"),
            //     ProfileDetailRow(title: "Date of Birth", value: "05/12/2001")
            //   ],
            // ),
            kHalfSizedBox,
            const PersonalDetails(
              title: "Email",
              value: "bhaskar@iiitkalyani.ac.in",
            ),
            const PersonalDetails(
              title: "Date of Joining",
              value: "04-12-2015",
            ),
            const PersonalDetails(
              title: "Date of Birth",
              value: "15-03-1980",
            ),
            const PersonalDetails(
              title: "Father Name",
              value: "Unknown Biswas",
            ),
            const PersonalDetails(
              title: "Mother Name",
              value: "Unknown Biswas",
            ),
            const PersonalDetails(
              title: "Phone Number",
              value: "+91-9492327381",
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
          // const Icon(
          //   Icons.lock_outline,
          //   size: 20.0,
          // ),
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
          // const Icon(
          //   Icons.lock_outline,
          //   size: 20.0,
          // ),
        ],
      ),
    );
  }
}
