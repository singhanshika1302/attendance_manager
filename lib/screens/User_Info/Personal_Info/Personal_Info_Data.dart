// import 'package:flutter/material.dart';
import 'package:edumarshals/Widget/CustomAppBar.dart';
import 'package:edumarshals/main.dart';
import 'package:edumarshals/repository/PersonalInforepo.dart';
import 'package:edumarshals/Utils/Utilities/utilities2.dart';
import 'package:flutter/material.dart';
// import 'package:your_app/personal_info_repository.dart'; // Import your repository

class PersonalInfoScreen extends StatefulWidget {
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final PersonalInfoRepository _repository = PersonalInfoRepository(
      'https://akgec-edu.onrender.com/v1/student/profile/personalInfo');
  Map<String, dynamic>? _personalInfo;

  @override
  void initState() {
    super.initState();
    _fetchPersonalInfo();
  }

  Future<void> _fetchPersonalInfo() async {
    try {
      final token =
          '${PreferencesManager().token}'; // Replace with your actual token
      final data = await _repository.fetchPersonalInfo(token);
      setState(() {
        _personalInfo = data['personalInfo'];
      });
    } catch (e) {
      // Handle error
      print('Error fetching personal info: $e');
    }

    PreferencesManager().studentNumber = _personalInfo!['studentNumber'];
    PreferencesManager().universityRollNumber =
        _personalInfo!['universityRollNumber'];
print(_personalInfo!['semester']);
int sem=_personalInfo!['semester'];
            PreferencesManager().sem = sem;
            print("jhgfds  ${PreferencesManager().sem}");

            // print(PreferencesManager().semester);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 246, 255, 1),
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Personal Info",
              style: TextStyle(fontFamily: "popins"),
            ),
          ],
        ),
      ),
      body: _personalInfo != null
          ? ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(title: 'Name', value: _personalInfo!['name']),
                    buildInfoItem(
                        title: 'Student Number',
                        value: _personalInfo!['studentNumber']),
                  ],
                ),
                
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(
                        title: 'University Roll Number',
                        value: _personalInfo!['universityRollNumber']),
                    
                    buildInfoItem(title: 'Gender', value: _personalInfo!['gender']),
                  ],
                ),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(title: 'DOB', value: _personalInfo!['dob']),
                    buildInfoItem(
                        title: 'Course Name', value: _personalInfo!['courseName']),
                  ],
                ),
                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(
                        title: 'Admission Date',
                        value: _personalInfo!['admissionDate']),
                    buildInfoItem(title: 'Branch', value: _personalInfo!['branch']),
                  ],
                ),

                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(
                        title: 'Semester',
                        value: _personalInfo!['semester']
                            .toString()), // Convert integer to string
                    
                    buildInfoItem(
                        title: 'Admission Mode',
                        value: _personalInfo!['admissionMode']),
                  ],
                ),
                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(
                        title: 'Section', value: _personalInfo!['section']),
                    
                    buildInfoItem(
                        title: 'Category', value: _personalInfo!['category']),
                  ],
                ),
                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(
                        title: 'Domicile State',
                        value: _personalInfo!['domicileState']),
                    buildInfoItem(
                        title: 'JEE Rank', value: _personalInfo!['jeeRank']),
                  ],
                ),
                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(
                        title: 'JEE Roll No', value: _personalInfo!['jeeRollNo']),
                    buildInfoItem(
                        title: 'Lateral Entry',
                        value: _personalInfo!['lateralEntry']),
                  ],
                ),
                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(title: 'Hostel', value: _personalInfo!['hostel']),
                  ],
                ),

                // Add more ListTile widgets for other fields
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
