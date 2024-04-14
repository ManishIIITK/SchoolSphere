import 'package:flutter/material.dart';
import 'package:school_management_app/components/custom_button.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/signup_screen/sign_up_student.dart';
import 'package:school_management_app/screens/signup_screen/sign_up_teacher.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = 'signUpScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOtherColor,
      appBar: AppBar(
        title: const Text('Sign Up Options'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onPress: () {
                Navigator.pushNamed(context, SignUpAsStudent.routeName);
              },
              title: 'Sign Up as Student',
              iconData: Icons.arrow_forward_outlined,
            ),
            SizedBox(height: kDefaultPadding),
            CustomButton(
              onPress: () {
                Navigator.pushNamed(context, SignUpAsTeacher.routeName);
              },
              title: 'Sign Up as Teacher',
              iconData: Icons.arrow_forward_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
