import 'dart:async';
import 'dart:convert';
import 'package:edumarshals/repository/timetable_repository.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class ExamTimetableScreen extends StatefulWidget {
  @override
  _ExamTimetableScreenState createState() => _ExamTimetableScreenState();
}

class _ExamTimetableScreenState extends State<ExamTimetableScreen> {
  final ExamTimetableRepository _repository = ExamTimetableRepository();
  String? _examTimetableData;

  @override
  void initState() {
    super.initState();
    _fetchExamTimetableData();
  }

//..............call the repository where function for intigrate api is stored............//
  Future<void> _fetchExamTimetableData() async {
    String? examTimetableData = await _repository.fetchExamTimetable();
    if (examTimetableData != null) {
      final jsonData = jsonDecode(examTimetableData);
//...........separating the Url from whole dataset........................................//
      final examTimetableUrl = jsonData['examTimetable']['examTimetableUrl'];

      setState(() {
        _examTimetableData = examTimetableUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Timetable'),
      ),
      body: Center(
        child: _examTimetableData != null
            ? Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Container(
                  margin: EdgeInsets.all(0.0),
                  height: screenHeight * 0.65,
                  width: screenWidth * 1,
//..............showing the image in landScape view.....................//
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Image.network(
                      _examTimetableData!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
