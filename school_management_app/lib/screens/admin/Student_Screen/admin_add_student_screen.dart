// admin_add_student_screen.dart
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:school_management_app/components/custom_button.dart';
import 'package:school_management_app/constants/constants.dart';

class AdminAddStudentScreen extends StatelessWidget {
  static const routeName = 'AdminAddStudentScreen';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _admissionNumberController =
      TextEditingController();

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform the action to add the new student
      String firstName = _firstNameController.text;
      String lastName = _lastNameController.text;
      String fatherName = _fatherNameController.text;
      String motherName = _motherNameController.text;
      String email = _emailController.text;
      String phone = _phoneController.text;
      String dob = _dobController.text;
      String admissionNumber = _admissionNumberController.text;

      // TODO: Implement logic to add the new student (e.g., API call or database insertion)

      // Print the collected data (for demonstration purposes)
      print(
          'First Name: $firstName, Last Name" $lastName, Father Name: $fatherName, Mother Name: $motherName, '
          'Email: $email, Phone: $phone, DOB: $dob, Admission Number: $admissionNumber');

      // Show a toast message
      Fluttertoast.showToast(
        msg: 'Student added successfully!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      // Clear text fields
      _firstNameController.clear();
      _lastNameController.clear();
      _fatherNameController.clear();
      _motherNameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _dobController.clear();
      _admissionNumberController.clear();

      // Navigate back to the previous screen or perform any other navigation logic
      Navigator.pop(context);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Student'),
        centerTitle: true,
      ),
      backgroundColor: kOtherColor,
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  style: const TextStyle(
                      color: kTextBlackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300),
                  controller: _firstNameController,
                  decoration:
                      const InputDecoration(labelText: 'Student First Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the student name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: const TextStyle(
                      color: kTextBlackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300),
                  controller: _lastNameController,
                  decoration:
                      const InputDecoration(labelText: 'Student Last Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the student name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: const TextStyle(
                      color: kTextBlackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300),
                  controller: _fatherNameController,
                  decoration: const InputDecoration(labelText: 'Father Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the father name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: const TextStyle(
                      color: kTextBlackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300),
                  controller: _motherNameController,
                  decoration: const InputDecoration(labelText: 'Mother Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the mother name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: const TextStyle(
                      color: kTextBlackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300),
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email ID'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the email ID';
                    } else if (!RegExp(
                            r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                        .hasMatch(value)) {
                      return 'Invalid email format';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: const TextStyle(
                      color: kTextBlackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300),
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the phone number';
                    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return 'Invalid phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: const TextStyle(
                      color: kTextBlackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300),
                  controller: _dobController,
                  decoration: const InputDecoration(labelText: 'Date of Birth'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the date of birth';
                    }
                    // You can add additional validation for date format or range if needed
                    return null;
                  },
                ),
                TextFormField(
                  style: const TextStyle(
                      color: kTextBlackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300),
                  controller: _admissionNumberController,
                  decoration:
                      const InputDecoration(labelText: 'Admission Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the admission number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                onPress:(){
                  _submitForm(context);
                }, 
                title: "Add Student", 
                iconData: Icons.done)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
