import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final IconData iconData;

  const DefaultButton(
      {super.key,
      required this.onPress,
      required this.title,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(
            left: kDefaultPadding, right: kDefaultPadding),
        padding: const EdgeInsets.only(right: kDefaultPadding),
        width: double.infinity,
        height: 45.0,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [kSecondaryColor, TPrimaryColor],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.1],
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 17.0,
                ),
          ),
          const Spacer(),
          Icon(
            iconData,
            size: 30.0,
            color: kOtherColor,
          )
        ]),
      ),
    );
  }
}
