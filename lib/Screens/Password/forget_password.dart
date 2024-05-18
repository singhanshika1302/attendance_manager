import 'dart:convert';

import 'package:edumarshals/Screens/Password/Verify_Otp.dart';
import 'package:edumarshals/Utils/Utilities/utilities2.dart';
import 'package:edumarshals/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController username = TextEditingController();

  Future<void> resetPassword() async {
    final response = await http.post(
      Uri.parse('https://akgec-edu.onrender.com/v1/student/resetPassword'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username.text,
      }),

    );
        PreferencesManager().userid = username.text;
print(response.statusCode);
// print()
    if (response.statusCode == 200) {
      
      print("api inegrated");
      // If the server returns a 200 OK response, navigate to the Verify_Otp screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Verify_Otp()),
      );
    } else {
      // If the server does not return a 200 OK response, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to reset password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget password"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              buildtextfiled1("asset/images/user.png", "UserID", context, "Enter userID", false, username),
              SizedBox(height: 19),
              ElevatedButton(
                onPressed: () async {
                  await resetPassword();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(0, 75, 184, 1),
                  ),
                ),
                child: const Text(
                  '       Send OTP       ',
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

Widget buildtextfiled1(String image, String text, BuildContext context,
    String hinttext, bool obscure, TextEditingController controller) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: CustomText(
          text: text,
          color: const Color(0xFF3386FF),
          fontSize: 12,
          fontStyle: null,
          fontfamily: 'Poppins',
        ),
      ),
      Container(
        // decoration: BoxDecoration(
        //   border: Border.all(color: Color(0xFFA0A0A0)),
        //   borderRadius: BorderRadius.circular(10),
        // ),
        child: Row(
          children: [
            SizedBox(
              width: screenWidth * 0.8,
              child: TextFormField(
                controller: controller,
                obscureText: obscure,
                style: const TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid value';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      image,
                      height: screenHeight * 0.032,
                    ),
                  ),
                  fillColor: const Color.fromARGB(0, 17, 90, 216),
                  filled: true,
                  hintText: hinttext,
                  hintStyle: const TextStyle(
                      color: Color(0xFF565656),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFFA0A0A0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF3386FF)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
