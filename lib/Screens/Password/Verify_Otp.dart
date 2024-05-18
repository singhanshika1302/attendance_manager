import 'dart:convert';

import 'package:edumarshals/Screens/Password/Reset_Password.dart';
import 'package:edumarshals/Screens/Password/forget_password.dart';
import 'package:edumarshals/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Verify_Otp extends StatefulWidget {
  const Verify_Otp({super.key});

  @override
  State<Verify_Otp> createState() => _Verify_OtpState();
}

class _Verify_OtpState extends State<Verify_Otp> {
  TextEditingController otpController = TextEditingController();

  Future<void> verifyOtp() async {

    final response = await http.post(
      Uri.parse('https://akgec-edu.onrender.com/v1/student/verifyOtp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username': PreferencesManager().userid,
        'otp': int.parse(otpController.text),
      }),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, navigate to the Reset_Password screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => reset_password()),
      );
    } else {
      // If the server does not return a 200 OK response, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to verify OTP')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter OTP password"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              buildtextfiled1("asset/images/user.png", "ENTER OTP", context, "Enter OTP", false, otpController),
              SizedBox(height: 19),
              ElevatedButton(
                onPressed: () async {
                  await verifyOtp();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(0, 75, 184, 1),
                  ),
                ),
                child: const Text(
                  '       Verify OTP       ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}