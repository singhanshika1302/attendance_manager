// import 'package:edumarshals/screens/login.dart';
import 'package:edumarshals/Screens/Login/login.dart';
import 'package:edumarshals/main.dart';
import 'package:flutter/material.dart';
import 'package:edumarshals/utilities.dart';

class contactInfo extends StatefulWidget {
  const contactInfo({super.key});

  @override
  State<contactInfo> createState() => _contactInfoState();
}

class _contactInfoState extends State<contactInfo> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingControlle = TextEditingController();
  final TextEditingController _altEmailController = TextEditingController();
  final TextEditingController _altMobController = TextEditingController();
  final TextEditingController _permanentController = TextEditingController();
  final TextEditingController _presentController = TextEditingController();
  final TextEditingController _perPinController = TextEditingController();
  final TextEditingController _prePinController = TextEditingController();
  final TextEditingController _perStateController = TextEditingController();
  final TextEditingController _preStateController = TextEditingController();
  final TextEditingController _perCountryController = TextEditingController();
  final TextEditingController _preCountryController = TextEditingController();
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
        upper('Contact Details', 0, 0, context, const Login()),
        SizedBox(
          height: screenHeight * 0.025,
        ),
        // UserInput('Email', 'Mob no', context),
        // SizedBox(
        //   height: screenHeight * 0.00,
        // ),
        // UserInput('Alternate Email', 'Alternate Mob no'
        //     , context),
        // // UserInput('', _admissionController, 'Email(Mother)',
        // // _branchController, context),
        // UserInput1('Permanent Address', _permanentController, context),
        // UserInput1('Present Address', _presentController, context),
        // UserInput('Permanent Pincode', 'Present Pincode',
        //    context),
        // UserInput('Permanent State', 'Present State',
        //    context),
        // // UserInput1('Address', _domacileController, context),
        // UserInput('Permanent Country', 'Present Country',
        //    context),
        // // UserInput('JEE Rank', _jeeController, 'JEE Roll no', _jeeRollController,
        // //     context),
        // // UserInput('Lateral Entry', _lateralController, 'Hostel',
        // //     _hostelController, context),
      ],
    );
  }
}














