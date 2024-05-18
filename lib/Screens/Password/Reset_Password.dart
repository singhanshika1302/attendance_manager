import 'dart:convert';

import 'package:edumarshals/Screens/Login/login.dart';
import 'package:edumarshals/Screens/Password/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class reset_password extends StatefulWidget {
  const reset_password({super.key});

  @override
  State<reset_password> createState() => _reset_passwordState();
}

class _reset_passwordState extends State<reset_password> {
  TextEditingController newPasswordController = TextEditingController();

  Future<void> setNewPassword() async {
    final response = await http.post(
      Uri.parse('https://akgec-edu.onrender.com/v1/student/setNewPassword'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'newPassword': newPasswordController.text,
      }),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, navigate to the Login screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } else {
      // If the server does not return a 200 OK response, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to set new password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New password"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              buildtextfiled1("asset/images/user.png", " New Password", context, "Enter new password", false, newPasswordController),
              SizedBox(height: 19),
              ElevatedButton(
                onPressed: () async {
                  await setNewPassword();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(0, 75, 184, 1),
                  ),
                ),
                child: const Text(
                  '       Submit      ',
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
