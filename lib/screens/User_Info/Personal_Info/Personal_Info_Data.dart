// import 'package:flutter/material.dart';
import 'package:edumarshals/Widget/CustomAppBar.dart';
import 'package:edumarshals/main.dart';
import 'package:edumarshals/repository/PersonalInforepo.dart';
import 'package:edumarshals/utilities.dart';
import 'package:flutter/material.dart';
// import 'package:your_app/personal_info_repository.dart'; // Import your repository

class PersonalInfoScreen extends StatefulWidget {
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final PersonalInfoRepository _repository = PersonalInfoRepository('https://akgec-edu.onrender.com/v1/student/profile/personalInfo');
  Map<String, dynamic>? _personalInfo;

  @override
  void initState() {
    super.initState();
    _fetchPersonalInfo();
  }

  Future<void> _fetchPersonalInfo() async {
    try {
      final token = '${PreferencesManager().token}'; // Replace with your actual token
      final data = await _repository.fetchPersonalInfo(token);
      setState(() {
        _personalInfo = data['personalInfo'];
      });
    } catch (e) {
      // Handle error
      print('Error fetching personal info: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 246, 255, 1),
      appBar: AppBar(
        title: Column(
        children: [
          Text("Personal Info",style: TextStyle(fontFamily:"popins"),),
       
        ],
        
      ),
    
      ),
      body: _personalInfo != null
          ? ListView(
              children: [
                ListTile(
                  title: Text('Name: ${_personalInfo!['name']}'),
                ),
             
                ListTile(
                  title: Text('Gender: ${_personalInfo!['gender']}'),
                ),
                ListTile(
                  title: Text('dob: ${_personalInfo!['dob']}'),
                ),
                ListTile(
                  title: Text('courseName: ${_personalInfo!['courseName']}'),
                ),
                ListTile(
                  title: Text('admissionDate: ${_personalInfo!['admissionDate']}'),
                ),
                ListTile(
                  title: Text('branch: ${_personalInfo!['branch']}'),
                ),
                ListTile(
                  title: Text('semester: ${_personalInfo!['semester']}'),
                ),
                ListTile(
                  title: Text('admissionMode: ${_personalInfo!['admissionMode']}'),
                ),
                  ListTile(
                  title: Text('section: ${_personalInfo!['section']}'),
                ),
                  ListTile(
                  title: Text('category: ${_personalInfo!['category']}'),
                ),
                  ListTile(
                  title: Text('domicileState: ${_personalInfo!['domicileState']}'),
                ),
                  ListTile(
                  title: Text('jeeRank: ${_personalInfo!['jeeRank']}'),
                ),
                  ListTile(
                  title: Text('jeeRollNo: ${_personalInfo!['jeeRollNo']}'),
                ),
                   ListTile(
                  title: Text('lateralEntry: ${_personalInfo!['lateralEntry']}'),
                ),
                   ListTile(
                  title: Text('hostel: ${_personalInfo!['hostel']}'),
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

