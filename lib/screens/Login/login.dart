import 'dart:io';

// import 'package:edumarshals/Screens/OverAllAttendance.dart';
// import 'package:edumarshals/Screens/Attendance/OverAllAttendance.dart';
import 'package:edumarshals/Screens/Attendance/OverAllAttendance.dart';
import 'package:edumarshals/Screens/HomePage/Homepage.dart';
import 'package:edumarshals/Screens/User_Info/Personal_Info/Contact_info_Data.dart';
import 'package:edumarshals/Screens/User_Info/Personal_Info/Parent_Info_Data.dart';
import 'package:edumarshals/Screens/User_Info/Personal_Info/Personal_Info_Data.dart';
import 'package:edumarshals/main.dart';
import 'package:edumarshals/screens/time_table.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:edumarshals/utilities.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  bool isChecked = false;
  bool _isLoading = false;
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2025),
      // barrierColor: Color.fromARGB(60, 0, 74, 184),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF004BB8), // Background color
              onPrimary: Colors.white, // Selected date text color
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = DateTime(picked.year, picked.month, picked.day);
      });
    }
  }

  Future<void> _saveItem() async {
    setState(() {
      _isLoading = true;
    });
    String formattedDate = selectedDate != null
        ? DateFormat('dd-MM-yyyy').format(selectedDate!)
        : '';
    final url = Uri.https('akgec-edu.onrender.com', '/v1/student/login');

    final Map<String, String> requestBody = {
      'password': _passController.text,
      'username': _usernameController.text,
      'dob': formattedDate,
    };
    
    try {
      final response = await http.post(
        url,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );
              // PreferencesManager().email=userna;

      //
      print(response.statusCode);
      if (response.statusCode == 200) {
        dynamic setCookieHeader = response.headers['set-cookie'];

        List<String>? cookies;
        // print(response.Cookies);
        print('Response headers: ${response.headers}');
        print('Cookies from response: ${response.headers['set-cookie']}');

        if (setCookieHeader is String) {
          cookies = [setCookieHeader];
        } else if (setCookieHeader is List<String>) {
          cookies = setCookieHeader;
        } else {
          cookies = [];
        }

        print('Response Headers: $setCookieHeader');

        String accessToken = '';
        // String

        if (cookies.isNotEmpty) {
          accessToken = cookies
              .map((cookie) => cookie.split(';').first)
              .firstWhere((value) => value.startsWith('accessToken='),
                  orElse: () => '');
        }
        String actualAccessToken = accessToken.substring("accesstoken=".length);

        print('Access Token from Cookie: $actualAccessToken');
        PreferencesManager().token = actualAccessToken;

        if (actualAccessToken.isNotEmpty) {
          // prefs.setString('token', actualAccessToken);
          print('Token stored in prefs: $actualAccessToken');
        } else {
          // Handle the case where the token is empty
          print('Token is empty');
        }

        final Map<String, dynamic> responseData = json.decode(response.body);
        final message = responseData['message'];
        final name = responseData['name'];

        print('Message from API: $message');
        print('Message from API: $name');
        print('dob :$formattedDate');
        
        PreferencesManager().name=name;
        // Update UI to show success message or navigate to another screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 3),
          ),
        );

        setState(() {
          _isLoading = false;
        });
        // for navigaation to next page
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>Homepage() ));
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) =>
        //           otpVerification(email: _emailController.text),
        //     ));
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final message = responseData['message'];
        print('Failed: $message');
        print('dob :$formattedDate');
        // Update UI to show success message or navigate to another screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 3),
          ),
        );
        setState(() {
          _isLoading = false;
        });
        // print('Failed: ${response.statusCode}');
      }
    } catch (e) {
      print('dob :$formattedDate');
      print('Error: $e');
      setState(() {
        _isLoading = false;
      });
    }
 if (isChecked) {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
    prefs.setString('password', _passController.text);
  }


  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Android Large - 18.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
            backgroundColor: const Color.fromARGB(0, 151, 147, 147),
            body: ListView(
              children: [buildheading(context)],
            )),
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
          // Spacer(),
          // Padding(padding: EdgeInsets.all(18)),
        Positioned(
            bottom: 500,
            right: 100.0,
            child: button3('Login', 0.6, 0.5, context, () => const Login())),
        Positioned(
          bottom: screenHeight * 0.69,
          right: screenWidth * 0.29,
          child: Image.asset(
            'assets/Frame 100.png',
            scale: 4.5,
          ),

          // child: button3('Login', 0.6, 0.5, context, () => Login())
        ),
      ],
    );
  }

  Widget buildheading(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
  //    _usernameController ??= TextEditingController();
  // _passController ??= TextEditingController();
  SharedPreferences.getInstance().then((prefs) {
    final savedUsername = prefs.getString('username');
    final savedPassword = prefs.getString('password');
    final savedDob = prefs.getString('dob'); 
    
    if (savedUsername != null) {
      _usernameController.text = savedUsername;
      setState(() {
        isChecked = true;
      });
    }

    if (savedPassword != null) {
      _passController.text = savedPassword;
    }

  //    if (savedDob != null) {
  //   // Parse saved date string to DateTime
  //   final savedDate = DateFormat('dd-MM-yyyy').parse(savedDob);
  //   setState(() {
  //     selectedDate = savedDate;
  //   });
  // }
  });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: screenHeight * 0.02),
        const CustomText(
          text: "Login",
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 44,
          fontStyle: null,
          fontfamily: '',
        ),
        SizedBox(height: screenHeight * 0.07),
        Stack(children: [
          Container(
              width: screenWidth * 0.85,
              height: screenHeight * 0.47,
              decoration: ShapeDecoration(
                color: const Color(0xFFFBFBFB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x26E0E0E0),
                    blurRadius: 30,
                    offset: Offset(0, 3),
                    spreadRadius: 3,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  buildtextfiled(
                    'assets/User.png',
                    "User ID",
                    context,
                    "Enter User ID",
                    false,
                    _usernameController,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  buildtextfiled(
                    'assets/shield-security.png',
                    "Password",
                    context,
                    "Enter Password",
                    false,
                    _passController,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 50.0),
                        child: CustomText(
                          text: "Date of Birth",
                          color: Color(0xFF3386FF),
                          fontSize: 12,
                          fontStyle: null,
                          fontfamily: 'Poppins',
                          // fontWeight: FontWeight.w400,
                        ),
                      ),
                      // Spacer()/
                      Padding(padding: EdgeInsets.all(4)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => _selectDate(context),
                            child: Container(
                              // height: screenHeight * .05,
                              width: screenWidth * 0.7,
                              decoration: const BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                // border: Border.(
                                //   color: Color(0xff00194A),
                                // ),
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xFFA0A0A0)),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 0, right: 0),
                                child: Center(
                                    child: selectedDate == null
                                        ? Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(right: 10),
                                                // child: Icon(
                                                //   Icons.calendar_month,
                                                //   size: 20,
                                                //   color: Color(0xff617193),
                                                // ),
                                                child: Image.asset(
                                                  'assets/calendar.png',
                                                  scale: 4.5,
                                                  // height: screenHeight * 0.032,
                                                ),
                                              ),
                                              Text(
                                                // '  Enter D.O.B',
                                                selectedDate != null
                                                    ? DateFormat('dd-MM-yyyy')
                                                        .format(selectedDate!)
                                                    : 'Enter D.O.B',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF565656),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(right: 15),
                                                child: Image.asset(
                                                  'assets/calendar.png',
                                                  scale: 4.5,
                                                  // height: screenHeight * 0.032,
                                                ),
                                              ),
                                              Text(
                                                '${selectedDate!.toLocal()}'
                                                    .split(' ')[0],
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: isChecked,
                            splashRadius: 20,
                            activeColor: const Color(0xFF004BB8),
                            onChanged: (bool? value) {
                              setState(() {
                                // Color? Color(0xFF004BB8)
                                isChecked = value ?? false;
                              });
                            }),
                        SizedBox(
                          width: screenWidth * 0.001,
                        ),
                        const CustomText(
                          text: "Remember me",
                          color: Color(0xFF828282),
                          fontSize: 12,
                          fontStyle: null,
                          fontfamily: 'Poppins',
                        ),
                      ],
                    ),
                  )
                ]),
              )),

        
          Positioned(
            bottom: 0,
            left: 80,
            right: 00,
            child: FractionallySizedBox(
              widthFactor:
                  0.7, // Adjust the portion of the button inside the container
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
              
                onPressed: () async {
                  await _saveItem();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => OverAllAttd()));

                  // Add your onPressed logic here
                },
                
              style: ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(0, 75, 184, 1))),
                child: const Text('Login',style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
        ]),
        // Positioned(
        //   bottom: 00,
        //   left: 80,
        //   right: 00,
        //   top: 400,
        //   child: FractionallySizedBox(
        //     widthFactor:
        //         0.7, // Adjust the portion of the button inside the container
        //     alignment: Alignment.centerLeft,
        //     child: ElevatedButton(
        //       onPressed: () async {
        //         await _saveItem();

        //         // Add your onPressed logic here
        //       },
        //       child: Text('Login'),
        //     ),
        //   ),
        // ),
        SizedBox(height: screenHeight * 0.154),
        const CustomText(
          text: "Forget your password?",
          color: Colors.white,
          fontSize: 20,
          fontStyle: null,
          fontfamily: '',
        ),
        SizedBox(height: screenHeight * 0.03),
        // const CustomText(
        //   text: "Reset Password",
        //   color: Colors.white,
        //   fontSize: 15,
        //   fontStyle: null,
        //   fontfamily: '',
        // ),
        Container(
          decoration: const BoxDecoration(
            // borderRadius: BorderRadius.circular(10),
            // border: Border.(
            //   color: Color(0xff00194A),
            // ),
            border: Border(
              bottom: BorderSide(width: 1, color: Color(0xFFFBFBFB)),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              // Handle the onTap event here
              print('Container tapped!');
              // Add your logic for resetting password here
            },
            child: const Text(
              'Reset Password',
              style: TextStyle(
                color: Color(0xFFFBFBFB),
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
