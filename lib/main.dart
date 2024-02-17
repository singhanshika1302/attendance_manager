import 'package:flutter/material.dart';
import 'Screens/Homepage.dart';
import 'package:edumarshals/screens/splash.dart';
import 'package:flutter/material.dart';
// import 'package:t/homePage.dart';
import 'package:edumarshals/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//     );
//   }
// }
