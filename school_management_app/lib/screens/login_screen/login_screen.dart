import 'package:flutter/material.dart';
import 'package:school_management_app/components/custom_button.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/admin/Home_Screen/admin_home_screen.dart';
import 'package:school_management_app/screens/students/home_screen/home_screen.dart';
import 'package:school_management_app/screens/teachers/Home_Screen/home_screen.dart';

late bool _passwordVisible;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = 'loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ListView(
          children: [
            // dividing the screen into two half
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/splash.png',
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hi",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("User", style: Theme.of(context).textTheme.bodyLarge)
                    ],
                  ),
                  const SizedBox(
                    height: kDefaultPadding / 6,
                  ),
                  Text("Sign In To Continue",
                      style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding * 3),
                  topRight: Radius.circular(kDefaultPadding * 3),
                ),
                color: kOtherColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          sizedBox,
                          buildEmailField(),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          buildPasswordField(),
                          sizedBox,
                          DefaultButton(
                            onPress: () {
                              if (_formKey.currentState!.validate()) {
                                if (_emailController.text ==
                                    "manishiiitk@gmail.com") {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      StudentHomeScreen.routeName,
                                      (route) => false);
                                } else if (_emailController.text ==
                                    "bhaskar@iiitkalyani.ac.in") {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      TeacherHomeScreen.routeName,
                                      (route) => false);
                                } else if (_emailController.text ==
                                    "admin@iiitkalyani.ac.in") {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      AdminHomeScreen.routeName,
                                      (route) => false);
                                }
                              }
                            },
                            title: "Sign In",
                            iconData: Icons.arrow_forward_outlined,
                          ),
                          sizedBox,
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Forgot Password ?',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: kPrimaryColor, fontSize: 15.0),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      // textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
          color: kTextBlackColor, fontSize: 18.0, fontWeight: FontWeight.w300),
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email),
        labelText: "Enter Email",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        isDense: true,
      ),
      controller: _emailController,
      validator: (value) {
        RegExp regExp = RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return "Email Field cannot be empty";
        } else if (!regExp.hasMatch(value)) {
          return "Please enter a valid email address";
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      // textAlign: TextAlign.start,
      obscureText: _passwordVisible,
      keyboardType: TextInputType.visiblePassword,
      style: const TextStyle(
          color: kTextBlackColor, fontSize: 18.0, fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.password),
        labelText: "Enter Password",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        isDense: true,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(
            _passwordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_off_outlined,
          ),
          iconSize: kDefaultPadding,
        ),
      ),
      controller: _passwordController,
      validator: (value) {
        if (value!.length < 7) {
          return "Password must be more than 7 characters";
        }
        return null;
      },
    );
  }
}
