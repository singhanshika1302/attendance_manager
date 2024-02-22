// import 'package:flutter/material.dart';
import 'package:edumarshals/Widget/CustomAppBar.dart';
import 'package:edumarshals/main.dart';
import 'package:edumarshals/repository/Contact_Info_Repo.dart';
// import 'package:edumarshals/repository/PersonalInforepo.dart';
import 'package:flutter/material.dart';
// import 'package:your_app/personal_info_repository.dart'; // Import your repository

class ContactInfoScreen extends StatefulWidget {
  @override
  _ContactInfoScreenState createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  final ContactInfoRepository _repository = ContactInfoRepository('https://akgec-edu.onrender.com/v1/student/profile/contactdetails');
  Map<String, dynamic>? contactDetails;

  @override
  void initState() {
    super.initState();
    _fetchContactInfo();
  }

  Future<void> _fetchContactInfo() async {
    try {
      final token = '${PreferencesManager().token}'; // Replace with your actual token
      final data = await _repository.fetchContactInfo(token);
      setState(() {
        contactDetails = data['contactDetails'];
      });
    } catch (e) {
      // Handle error
      print('Error fetching contactDetails info: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(userName:'rishi'),
      body: contactDetails != null
          ? ListView(
              children: [
                ListTile(
                  title: Text('email: ${contactDetails!['email']}'),
                ),
                ListTile(
                  title: Text('mobNo: ${contactDetails!['mobNo']}'),
                ),
                ListTile(
                  title: Text('alternateEmail: ${contactDetails!['alternateEmail']}'),
                ),
                ListTile(
                  title: Text('alternateMobNo: ${contactDetails!['alternateMobNo']}'),
                ),
                ListTile(
                  title: Text('permanentAddress: ${contactDetails!['permanentAddress']}'),
                ),
                ListTile(
                  title: Text('presentAddress: ${contactDetails!['presentAddress']}'),
                ),
                ListTile(
                  title: Text('permanentPincode: ${contactDetails!['permanentPincode']}'),
                ),
                ListTile(
                  title: Text('presentPincode: ${contactDetails!['presentPincode']}'),
                ),
                  ListTile(
                  title: Text('permanentState: ${contactDetails!['permanentState']}'),
                ),
                  ListTile(
                  title: Text('presentState: ${contactDetails!['presentState']}'),
                ),
                  ListTile(
                  title: Text('permanentCountry: ${contactDetails!['permanentCountry']}'),
                ),
                  ListTile(
                  title: Text('presentCountry: ${contactDetails!['presentCountry']}'),
                ),
                //   ListTile(
                //   title: Text('jeeRollNo: ${contactDetails!['jeeRollNo']}'),
                // ),
                //    ListTile(
                //   title: Text('lateralEntry: ${contactDetails!['lateralEntry']}'),
                // ),
                //    ListTile(
                //   title: Text('hostel: ${contactDetails!['hostel']}'),
                // ),

                // Add more ListTile widgets for other fields
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
