import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/login_screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const routeName = 'splashScreen';

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context, LoginScreen.routeName, (route) => false);
      },
    );

    return Scaffold(
      body: Center(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "School",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kTextWhiteColor,
                        fontSize: 50.0,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 2.0),
                  ),
                  Text("Sphere",
                      style: GoogleFonts.pattaya(
                          fontSize: 50.0,
                          fontStyle: FontStyle.italic,
                          color: kTextWhiteColor,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              Image.asset(
                'assets/images/school.png',
                height: 150.0,
                width: 150.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
