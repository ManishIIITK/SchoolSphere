import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/routes/routes.dart';
import 'package:school_management_app/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "School Management",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        primaryColor: kPrimaryColor,
        appBarTheme: const AppBarTheme(color: kPrimaryColor, elevation: 0),
        textTheme: GoogleFonts.sourceSans3TextTheme(Theme.of(context).textTheme)
            .apply()
            .copyWith(
              bodyLarge: const TextStyle(
                  color: kTextWhiteColor,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold),
              bodyMedium: const TextStyle(
                color: kTextWhiteColor,
                fontSize: 28.0,
              ),
              titleMedium: const TextStyle(
                  color: kTextWhiteColor,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500),
              titleSmall: const TextStyle(
                  color: kTextWhiteColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300),
            ),
        // input decoration theme for entire app
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle:
              TextStyle(fontSize: 18.0, color: kTextBlackColor, height: 5.0),
          hintStyle:
              TextStyle(fontSize: 16.0, color: kTextBlackColor, height: 5.0),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kTextLightColor, width: 0.7),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kTextLightColor,
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kTextLightColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kErrorBorderColor, width: 1.2),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kErrorBorderColor,
              width: 1.2,
            ),
          ),
        ),
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
