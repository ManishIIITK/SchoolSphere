import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';

class AdminName extends StatelessWidget {
  const AdminName({super.key, required this.adminName});

  final String adminName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Hi',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w200),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          adminName,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class AdminClass extends StatelessWidget {
  const AdminClass({super.key, required this.adminClass});

  final String adminClass;

  @override
  Widget build(BuildContext context) {
    return Text(
      adminClass,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontSize: 16.0, color: kTextWhiteColor),
    );
  }
}

class StudentYear extends StatelessWidget {
  const StudentYear({super.key, required this.session});
  final String session;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 20,
      decoration: BoxDecoration(
        color: kOtherColor,
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      child: Center(
        child: Text(
          session,
          style: const TextStyle(
              fontSize: 12.0,
              color: kTextBlackColor,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class AdminPicture extends StatelessWidget {
  const AdminPicture(
      {super.key, required this.picLocation, required this.onPress});

  final String picLocation;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // on tap go to the profile edit page
      onTap: onPress,
      child: CircleAvatar(
        minRadius: 50.0,
        maxRadius: 50.0,
        backgroundColor: kSecondaryColor,
        backgroundImage: AssetImage(picLocation),
      ),
    );
  }
}

class AdminDataCard extends StatelessWidget {
  const AdminDataCard(
      {super.key,
      required this.title,
      // required this.value,
      required this.onPress});

  final String title;
  // final String value;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 12,
        decoration: BoxDecoration(
            color: kOtherColor,
            borderRadius: BorderRadius.circular(kDefaultPadding)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16.0,
                  color: kTextBlackColor,
                  fontWeight: FontWeight.w800),
            ),
            // Text(
            //   value,
            //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //       fontSize: 25.0,
            //       color: kTextBlackColor,
            //       fontWeight: FontWeight.w400),
            // ),
          ],
        ),
      ),
    );
  }
}
