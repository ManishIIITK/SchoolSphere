import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';

class AssignmentButton extends StatelessWidget {
  const AssignmentButton(
      {super.key, required this.title, required this.onPress});

  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [kSecondaryColor, kPrimaryColor],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add, color: kOtherColor,),
              kHalfWidthSizedBox,
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: kOtherColor, fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AssingmentDetailsRow extends StatelessWidget {
  const AssingmentDetailsRow(
      {super.key, required this.title, required this.statusValue});
  final String title;
  final String statusValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: kTextLightColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w400),
        ),
        Text(
          statusValue,
          style: const TextStyle(
              color: kTextBlackColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
