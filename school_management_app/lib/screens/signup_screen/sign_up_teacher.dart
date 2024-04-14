// SignUpAsTeacher.dart
import 'package:flutter/material.dart';
import 'package:school_management_app/components/custom_button.dart';
import 'package:school_management_app/constants/constants.dart';

class SignUpAsTeacher extends StatefulWidget {
  static const routeName = 'signUpAsTeacher';

  SignUpAsTeacher({super.key});

  @override
  State<SignUpAsTeacher> createState() => _SignUpAsTeacherState();
}

class _SignUpAsTeacherState extends State<SignUpAsTeacher> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _regNoController = TextEditingController();

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
        title: const Text('Sign Up as Teacher'),
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
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  // You can add more complex password validation if needed
                  return null;
                },
              ),
              const SizedBox(height: kDefaultPadding),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  // You can add more phone number validation if needed
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
