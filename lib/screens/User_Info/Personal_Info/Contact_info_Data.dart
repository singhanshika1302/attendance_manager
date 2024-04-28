// import 'package:flutter/material.dart';
import 'package:edumarshals/Utils/Utilities/utilities2.dart';
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
  final ContactInfoRepository _repository = ContactInfoRepository(
      'https://akgec-edu.onrender.com/v1/student/profile/contactdetails');
  Map<String, dynamic>? contactDetails;

  @override
  void initState() {
    super.initState();
    _fetchContactInfo();
  }

  Future<void> _fetchContactInfo() async {
    try {
      final token =
          '${PreferencesManager().token}'; // Replace with your actual token
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
      backgroundColor: Color.fromRGBO(242, 246, 255, 1),
      appBar: AppBar(title: Text("Contact Details"),),
      body: contactDetails != null
          ? ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(title: 'Email', value: contactDetails!['email']),
                    buildInfoItem(
                        title: 'Mobile Number', value: contactDetails!['mobNo']),
                  ],
                ),
                Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(
                        title: 'Alternate Email',
                        value: contactDetails!['alternateEmail']),
                    buildInfoItem(
                        title: 'Alternate Mobile Number',
                        value: contactDetails!['alternateMobNo']),
                  ],
                ),
                Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(
                        title: 'Permanent Address',
                        value: contactDetails!['permanentAddress']),
                    buildInfoItem(
                        title: 'Present Address',
                        value: contactDetails!['presentAddress']),
                  ],
                ),
                Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(
                        title: 'Permanent Pincode',
                        value: contactDetails!['permanentPincode']),
                    buildInfoItem(
                        title: 'Present Pincode',
                        value: contactDetails!['presentPincode']),
                  ],
                ),
                Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(
                        title: 'Permanent State',
                        value: contactDetails!['permanentState']),
                    buildInfoItem(
                        title: 'Present State',
                        value: contactDetails!['presentState']),
                  ],
                ),
                Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(
                        title: 'Permanent Country',
                        value: contactDetails!['permanentCountry']),
                    buildInfoItem(
                        title: 'Present Country',
                        value: contactDetails!['presentCountry']),
                  ],
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

