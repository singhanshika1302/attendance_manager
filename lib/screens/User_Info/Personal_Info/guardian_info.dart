// import 'package:edumarshals/screens/login.dart';
import 'package:edumarshals/Screens/Login/login.dart';
import 'package:edumarshals/Utils/Utilities/utilities2.dart';
import 'package:edumarshals/main.dart';
import 'package:flutter/material.dart';

class guardianInfo extends StatefulWidget {
  const guardianInfo({super.key});

  @override
  State<guardianInfo> createState() => _guardianInfoState();
}

class _guardianInfoState extends State<guardianInfo> {
  final TextEditingController _fatherController = TextEditingController();
  final TextEditingController _motherController = TextEditingController();
  final TextEditingController _fatherMobController = TextEditingController();
  final TextEditingController _motherMobController = TextEditingController();
  final TextEditingController _emailFController = TextEditingController();
  final TextEditingController _emailMController = TextEditingController();
  final TextEditingController _aadharFController = TextEditingController();
  final TextEditingController _aadharMController = TextEditingController();
  final TextEditingController _occupationFController = TextEditingController();
  final TextEditingController _occupationMController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  // final TextEditingController _admissionModeController =
  //     TextEditingController();
  // final TextEditingController _domacileController = TextEditingController();
  // final TextEditingController _jeeController = TextEditingController();
  // final TextEditingController _jeeRollController = TextEditingController();
  // final TextEditingController _lateralController = TextEditingController();
  // final TextEditingController _hostelController = TextEditingController();
  // bool isChecked = false;
  final bool _isLoading = false;

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
              backgroundColor: const Color(0xFFEBF3FF),
              body: ListView(
                children: [buildheading(context)],
              )),
        ),
        if (_isLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: const Center(
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
            //child widget
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
               CustomText(
                text: PreferencesManager().name,
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 12,
                fontStyle: null,
                fontfamily: 'Poppins',
              ),
            ])),
        upper('Guardian Info', 0, 0, context, const Login()),
        SizedBox(
          height: screenHeight * 0.025,
        ),
        // UserInput('Father Name', _fatherController, 'Mother Name',
        //     _motherController, context),
        // SizedBox(
        //   height: screenHeight * 0.00,
        // ),
        // UserInput('Father Mob no', _fatherMobController, 'Mother Mob no',
        //     _motherMobController, context),
        // UserInput('Email(father)', _emailFController, 'Email(Mother)',
        //     _emailMController, context),
        // UserInput('Aadher No (Father)', _aadharFController, 'Aadher no(Mother)',
        //     _aadharMController, context),
        // UserInput('Occupation(Father)', _occupationFController,
        //     'Occupation(mother)', _occupationMController, context),
        // UserInput1('Address', _addressController, context)
        // UserInput('Category', _categoryController, 'Domacile State',
        //     _domacileController, context),
        // UserInput('JEE Rank', _jeeController, 'JEE Roll no', _jeeRollController,
        //     context),
        // UserInput('Lateral Entry', _lateralController, 'Hostel',
        //     _hostelController, context),
      ],
    );
  }
}
















// upper('Guardian Info', 0, 0, context, Login()),
//         SizedBox(
//           height: screenHeight * 0.025,
//         ),
//         UserInput('Father Name', _nameController, 'Mother Name',
//             _genderController, context),
//         SizedBox(
//           height: screenHeight * 0.00,
//         ),
//         UserInput('Father Mob no', _dobController, 'Mother Mob no',
//             _courseController, context),
//         UserInput('Email(father)', _admissionController, 'Email(Mother)',
//             _branchController, context),
//         UserInput('Aadher No (Father)', _semesterController,
//             'Aadher no(Mother)', _courseNameController, context),
//         UserInput('Occupation(Father)', _admController, 'Ocuupation(mother)',
//             _sectionController, context),
//         UserInput1('Address', _domacileController, context)