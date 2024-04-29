import 'dart:async';

// import 'package:edumarshals/Screens/Attendance/OverAllAttendance.dart';
import 'package:edumarshals/Screens/HomePage/Homepage.dart';
import 'package:edumarshals/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Login/login.dart';

// import 'sp';
String finalname = '';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
@override
void initState() {
  super.initState();
  Timer(const Duration(seconds: 3), () {
    SharedPreferences.getInstance().then((prefs) {
      final savedUsername = prefs.getString('username');
      final savedPassword = prefs.getString('password');
      final savedDob = PreferencesManager().dob;

      if (savedUsername != null && savedPassword != null && savedDob != null) {
        // If all necessary credentials are saved, navigate to HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
      } else {
        // If any credential is missing, navigate to Login screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      }
    });
  });
}


  Future getvalidationdata() async {
    var obname = PreferencesManager().name;
    setState(() {
      finalname = obname;
    });
    print(finalname);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
        backgroundColor: const Color(0xFFEBF3FF),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Image.asset(
                  'asset/images/Group 63.png',
                  // scale: 4,
                  // fit: BoxFit.cover,
                  // height: height * 0.2,
                  // width: width * 0.5,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.001,
            ),
            // const Text(
            //   'AKGEC EDUMARSHAL',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 17,
            //     fontFamily: 'Poppins',
            //     fontWeight: FontWeight.w500,
            //     // height: 0.02,
            //     // letterSpacing: -0.70,
            //   ),
            // ),
            // SizedBox(
            //   height: height * 0.05,
            // ),
            // SpinKitChasingDots(
            //   color: Color(0xFF004BB8),
            //   size: 40,
            // )
          ],
        )));
  }
}
