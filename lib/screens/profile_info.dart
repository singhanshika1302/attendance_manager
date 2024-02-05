import 'package:edumarshals/main.dart';
import 'package:edumarshals/screens/login.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:edumarshals/utilities.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class profileInfo extends StatefulWidget {
  const profileInfo({super.key});

  @override
  State<profileInfo> createState() => _profileInfoState();
}

class _profileInfoState extends State<profileInfo> {
  final TextEditingController _admissionController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _admController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _semesterController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _admissionModeController =
      TextEditingController();
  final TextEditingController _domacileController = TextEditingController();
  final TextEditingController _jeeController = TextEditingController();
  final TextEditingController _jeeRollController = TextEditingController();
  final TextEditingController _lateralController = TextEditingController();
  final TextEditingController _hostelController = TextEditingController();
  // bool isChecked = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        // Positioned(
        //   bottom: 100.0,
        //   right: 20.0,
        //   child: Image.asset('assets/Frame 100.png'),
        //   // child: button3('Login', 0.6, 0.5, context, () => Login())
        // ),
        // Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('assets/Android Large - 18.png'),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        // Positioned(
        //   bottom: 200.0,
        //   right: 40.0,
        //   child: Image.asset('assets/user-square.png'),
        //   // child: button3('Login', 0.6, 0.5, context, () => Login())
        // ),
        SafeArea(
          child: Scaffold(
              // backgroundColor: Color.fromARGB(248, 156, 184, 205),
              backgroundColor: Color(0xFFEBF3FF),
              body: ListView(
                children: [buildheading(context)],
              )),
        ),
        if (_isLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4E82EA)),
                strokeWidth: 5.0,
              ),
            ),
          ),
        // Positioned(
        //     bottom: 500,
        //     right: 100.0,
        //     child: button3('Login', 0.6, 0.5, context, () => Login())),
        // Positioned(
        //   bottom: 550.0,
        //   right: 120.0,
        //   child: Image.asset(
        //     'assets/Frame 100.png',
        //     scale: 4.5,
        //   ),

        //   // child: button3('Login', 0.6, 0.5, context, () => Login())
        // ),
      ],
    );
  }

  Widget buildheading(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: screenWidth * 1,
            height: screenHeight * 0.17,
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              // border: Border.(
              color: Color.fromARGB(255, 249, 249, 249),
              // ),
              border: Border(
                bottom: BorderSide(width: 1, color: Color(0xFFA0A0A0)),
              ),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Image.asset(
                'assets/Ellipse 7.jpg',
                scale: 4,
                // height: screenHeight * 0.032,
              ),
              const CustomText(
                text: "Tripod",
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 12,
                fontStyle: null,
                fontfamily: 'Poppins',
              ),
            ])),
        upper('Personal Info', 0, 0, context, Login()),
        SizedBox(
          height: screenHeight * 0.025,
        ),
        UserInput(
            'Name', _nameController, 'Gender', _genderController, context),
        SizedBox(
          height: screenHeight * 0.00,
        ),
        UserInput('Date of Birth', _dobController, 'Course Name',
            _courseController, context),
        UserInput('Admission Date', _admissionController, 'Branch',
            _branchController, context),
        UserInput('Semester', _semesterController, 'Course Name',
            _courseNameController, context),
        UserInput('Admission Mode', _admController, 'Section',
            _sectionController, context),
        UserInput('Category', _categoryController, 'Domacile State',
            _domacileController, context),
        UserInput('JEE Rank', _jeeController, 'JEE Roll no', _jeeRollController,
            context),
        UserInput('Lateral Entry', _lateralController, 'Hostel',
            _hostelController, context),
      ],
    );
  }
}
