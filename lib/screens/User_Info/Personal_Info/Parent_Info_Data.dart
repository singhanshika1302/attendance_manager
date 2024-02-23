// import 'package:flutter/material.dart';
import 'package:edumarshals/Widget/CustomAppBar.dart';
import 'package:edumarshals/main.dart';
import 'package:edumarshals/repository/Parent_Info_Repo.dart';
import 'package:flutter/material.dart';
// import 'package:your_app/personal_info_repository.dart'; // Import your repository

class ParentInfoScreen extends StatefulWidget {
  @override
  _ParentInfoScreenState createState() => _ParentInfoScreenState();
}

class _ParentInfoScreenState extends State<ParentInfoScreen> {
  final ParentInfoRepository _repository = ParentInfoRepository('https://akgec-edu.onrender.com/v1/student/profile/parentinfo');
  Map<String, dynamic>? parentsInfo;

  @override
  void initState() {
    super.initState();
    _fetchParentInfo();
  }

  Future<void> _fetchParentInfo() async {
    try {
      final token = '${PreferencesManager().token}'; // Replace with your actual token
      final data = await _repository.fetchParentInfo(token);
      setState(() {
        parentsInfo = data['parentsInfo'];
      });
    } catch (e) {
      // Handle error
      print('Error fetching parentsInfo info: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromRGBO(242, 246, 255, 1),
      appBar: CustomAppBar(userName:PreferencesManager().name),
      body: parentsInfo != null
          ? ListView(
              children: [
                ListTile(
                  title: Text('fatherName: ${parentsInfo!['fatherName']}'),
                ),
                ListTile(
                  title: Text('motherName: ${parentsInfo!['motherName']}'),
                ),
                ListTile(
                  title: Text('fatherMobNo: ${parentsInfo!['fatherMobNo']}'),
                ),
                ListTile(
                  title: Text('motherMobNo: ${parentsInfo!['motherMobNo']}'),
                ),
                ListTile(
                  title: Text('emailFather: ${parentsInfo!['emailFather']}'),
                ),
                ListTile(
                  title: Text('emailMother: ${parentsInfo!['emailMother']}'),
                ),
                ListTile(
                  title: Text('aadharNoFather: ${parentsInfo!['aadharNoFather']}'),
                ),
                ListTile(
                  title: Text('aadharNoMother: ${parentsInfo!['aadharNoMother']}'),
                ),
                  ListTile(
                  title: Text('occupationFather: ${parentsInfo!['occupationFather']}'),
                ),
                  ListTile(
                  title: Text('occupationMother: ${parentsInfo!['occupationMother']}'),
                ),
                  ListTile(
                  title: Text('address: ${parentsInfo!['address']}'),
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
