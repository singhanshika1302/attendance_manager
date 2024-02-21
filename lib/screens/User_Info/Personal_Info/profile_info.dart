// // import 'package:edumarshals/screens/login.dart';
// import 'package:edumarshals/Screens/Login/login.dart';
// import 'package:flutter/material.dart';
// import 'package:edumarshals/utilities.dart';

// class profileInfo extends StatefulWidget {
//   const profileInfo({super.key});

//   @override
//   State<profileInfo> createState() => _profileInfoState();
// }

// class _profileInfoState extends State<profileInfo> {
//   final bool _isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Stack(
//       children: [
//         SafeArea(
//           child: Scaffold(
//               backgroundColor: const Color(0xFFEBF3FF),
//               body: ListView(
//                 children: [buildheading(context)],
//               )),
//         ),
//         if (_isLoading)
//           Container(
//             color: Colors.black.withOpacity(0.5),
//             child: const Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4E82EA)),
//                 strokeWidth: 5.0,
//               ),
//             ),
//           ),
//       ],
//     );
//   }

//   Widget buildheading(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//             width: screenWidth * 1,
//             height: screenHeight * 0.17,
//             decoration: const BoxDecoration(
//               // borderRadius: BorderRadius.circular(10),
//               // border: Border.(
//               color: Color.fromARGB(255, 249, 249, 249),
//               // ),
//               border: Border(
//                 bottom: BorderSide(width: 1, color: Color(0xFFA0A0A0)),
//               ),
//             ),
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//               SizedBox(
//                 height: screenHeight * 0.04,
//               ),
//               Image.asset(
//                 'assets/Ellipse 7.jpg',
//                 scale: 4,
//                 // height: screenHeight * 0.032,
//               ),
//               const CustomText(
//                 text: "Tripod",
//                 color: Color.fromARGB(255, 0, 0, 0),
//                 fontSize: 12,
//                 fontStyle: null,
//                 fontfamily: 'Poppins',
//               ),
//             ])),
//         upper('Personal Info', 0, 0, context, const Login()),
//         SizedBox(
//           height: screenHeight * 0.025,
//         ),
//         // UserInput(
//         //     'Name' ,'Gender', context ),
//         // SizedBox(
//         //   height: screenHeight * 0.00,
//         // ),
//         // UserInput('Date of Birth','Course Name',
//         //  context ),
//         // UserInput('Admission Date', 'Branch',
//         //    context),
//         // UserInput('Semester', 'Course Name',
//         //    context),
//         // UserInput('Admission Mode', 'Section',
//         //    context),
//         // UserInput('Category', 'Domacile State',
//         //    context),
//         // UserInput('JEE Rank', 'JEE Roll no', 
//         //     context),
//         // UserInput('Lateral Entry', 'Hostel',
//         //      context),
//       ],
//     );
//   }
// }
