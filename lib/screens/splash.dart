import 'dart:async';
import 'login.dart';
import 'package:flutter/material.dart';
// import 'sp';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
        backgroundColor: Color(0xFFEBF3FF),
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
                  'assets/unnamed-removebg-preview 1.png',
                  scale: 4,
                  // fit: BoxFit.cover,
                  // height: height * 0.2,
                  // width: width * 0.5,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.001,
            ),
            Text(
              'AKGEC EDUMARSHAL',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                // height: 0.02,
                // letterSpacing: -0.70,
              ),
            ),
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
