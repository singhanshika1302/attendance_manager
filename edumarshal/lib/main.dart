import 'package:edumarshal/subject_wise_attendance.dart';
import 'package:edumarshal/subject_wise_attendance.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: barGraph(),
  
      
    
    );
  }
}

