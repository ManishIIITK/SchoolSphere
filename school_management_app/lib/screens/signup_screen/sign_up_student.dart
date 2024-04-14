import 'package:flutter/material.dart';
import 'package:school_management_app/components/custom_button.dart';
import 'package:school_management_app/constants/constants.dart';

class SignUpAsStudent extends StatefulWidget {
  static const routeName = 'signUpAsStudent';

  const SignUpAsStudent({super.key});

  @override
  _SignUpAsStudentState createState() => _SignUpAsStudentState();
}

class _SignUpAsStudentState extends State<SignUpAsStudent> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _regNoController = TextEditingController();
  final TextEditingController _rollNoController = TextEditingController();
  final TextEditingController _stdController = TextEditingController();
  final TextEditingController _dateOfJoiningController =
      TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _fathersNameController = TextEditingController();
  final TextEditingController _mothersNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _regNoController.dispose();
    _rollNoController.dispose();
    _stdController.dispose();
    _dateOfJoiningController.dispose();
    _dateOfBirthController.dispose();
    _fathersNameController.dispose();
    _mothersNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOtherColor,
      appBar: AppBar(
        title: const Text('Sign Up as Student'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: kDefaultPadding),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: kDefaultPadding),
              TextFormField(
                controller: _regNoController,
                decoration:
                    const InputDecoration(labelText: 'Registration Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your registration number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: kDefaultPadding),
              TextFormField(
                controller: _rollNoController,
                decoration: const InputDecoration(labelText: 'Roll Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your roll number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: kDefaultPadding),
              TextFormField(
                controller: _stdController,
                decoration:
                    const InputDecoration(labelText: 'Standard (e.g., 12th)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your standard';
                  }
                  return null;
                },
              ),
              const SizedBox(height: kDefaultPadding),
              TextFormField(
                controller: _dateOfJoiningController,
                decoration: const InputDecoration(
                    labelText: 'Date of Joining (YYYY-MM-DD)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your date of joining';
                  }
                  return null;
                },
              ),
              const SizedBox(height: kDefaultPadding),
              TextFormField(
                controller: _dateOfBirthController,
                decoration: const InputDecoration(
                    labelText: 'Date of Birth (YYYY-MM-DD)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your date of birth';
                  }
                  return null;
                },
              ),
              const SizedBox(height: kDefaultPadding),
              TextFormField(
                controller: _fathersNameController,
                decoration: const InputDecoration(labelText: "Father's Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your father's name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: kDefaultPadding),
              TextFormField(
                controller: _mothersNameController,
                decoration: const InputDecoration(labelText: "Mother's Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your mother's name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: kDefaultPadding),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: kDefaultPadding),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  RegExp regExp = RegExp(emailPattern);
                  if (value == null || value.isEmpty) {
                    return "Email Field cannot be empty";
                  } else if (!regExp.hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: kDefaultPadding),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  RegExp regExp = RegExp(mobilePattern);
                  if (value == null || value.isEmpty) {
                    return "Mobile Number Field cannot be empty";
                  } else if (!regExp.hasMatch(value)) {
                    return "Please enter a valid mobile number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: kDefaultPadding),
              CustomButton(
                title: 'Sign Up',
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    String firstName = _firstNameController.text;
                    String lastName = _lastNameController.text;
                    String regNo = _regNoController.text;
                    String rollNo = _rollNoController.text;
                    String std = _stdController.text;
                    String dateOfJoining = _dateOfJoiningController.text;
                    String dateOfBirth = _dateOfBirthController.text;
                    String fathersName = _fathersNameController.text;
                    String mothersName = _mothersNameController.text;
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    String phone = _phoneController.text;
                  }
                },
                iconData: Icons.app_registration_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
