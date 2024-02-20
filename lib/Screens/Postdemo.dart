import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PersonalInfoDisplayWidget extends StatefulWidget {
  const PersonalInfoDisplayWidget({super.key});

  @override
  _PersonalInfoDisplayWidgetState createState() => _PersonalInfoDisplayWidgetState();
}

class _PersonalInfoDisplayWidgetState extends State<PersonalInfoDisplayWidget> {
  late String name='';
  late String gender='';
  late String dob='';
  late String courseName='';
  late String admissionDate='';
  late String branch='';
  late int semester;
  late String admissionMode='';
  late String section='';
  late String category='';
  late String domicileState='';
  late String jeeRank='';
  late String jeeRollNo='';
  late String lateralEntry='';
  late String hostel='';

  @override
  void initState() {
    super.initState();
    fetchPersonalInfo();
  }

  Future<void> fetchPersonalInfo() async {
    final response = await http.get(Uri.parse('https://akgec-edu.onrender.com/v1/student/profile/personalInfo'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final personalInfo = data['personalInfo'];
      setState(() {
        name = personalInfo['name'];
        gender = personalInfo['gender'];
        dob = personalInfo['dob'];
        courseName = personalInfo['courseName'];
        admissionDate = personalInfo['admissionDate'];
        branch = personalInfo['branch'];
        semester = personalInfo['semester'];
        admissionMode = personalInfo['admissionMode'];
        section = personalInfo['section'];
        category = personalInfo['category'];
        domicileState = personalInfo['domicileState'];
        jeeRank = personalInfo['jeeRank'];
        jeeRollNo = personalInfo['jeeRollNo'];
        lateralEntry = personalInfo['lateralEntry'];
        hostel = personalInfo['hostel'];
      });
    } else {
      throw Exception('Failed to load personal info');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Info Display'),
      ),
      body: name != null && gender != null && dob != null
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: $name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Gender: $gender',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Date of Birth: $dob',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  // Include other fields similarly
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
