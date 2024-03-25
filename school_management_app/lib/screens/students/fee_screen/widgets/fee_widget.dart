import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';

class FeeDetailsRow extends StatelessWidget {
  const FeeDetailsRow(
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
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontSize: 14.0, color: kTextLightColor),
        ),
        Text(
          statusValue,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 14.0,
              color: kTextBlackColor,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class FeeButton extends StatelessWidget {
  const FeeButton(
      {super.key,
      required this.onPress,
      required this.iconData,
      required this.title});

  final VoidCallback onPress;
  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 40.0,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kSecondaryColor, kPrimaryColor],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(kDefaultPadding),
            bottomRight: Radius.circular(kDefaultPadding),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
            ),
            kHalfWidthSizedBox,
            Icon(
              iconData,
              color: kOtherColor,
              size: 30.0,
            )
          ],
        ),
      ),
    );
  }
}
