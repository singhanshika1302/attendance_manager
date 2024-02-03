<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'Screens/Homepage.dart';
=======
import 'package:edumarshals/screens/splash.dart';
import 'package:flutter/material.dart';
// import 'package:t/homePage.dart';
import 'package:edumarshals/screens/login.dart';
>>>>>>> 72208cd1ca8438b9f0db29a900382077acb21f67

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
=======
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
>>>>>>> 72208cd1ca8438b9f0db29a900382077acb21f67
