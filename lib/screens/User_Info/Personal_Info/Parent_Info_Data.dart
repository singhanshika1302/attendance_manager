// import 'package:flutter/material.dart';
import 'package:edumarshals/Widget/CustomAppBar.dart';
import 'package:edumarshals/main.dart';
import 'package:edumarshals/repository/Parent_Info_Repo.dart';
import 'package:edumarshals/utilities.dart';
import 'package:flutter/material.dart';
// import 'package:your_app/personal_info_repository.dart'; // Import your repository

class ParentInfoScreen extends StatefulWidget {
  @override
  _ParentInfoScreenState createState() => _ParentInfoScreenState();
}

class _ParentInfoScreenState extends State<ParentInfoScreen> {
  final ParentInfoRepository _repository = ParentInfoRepository(
      'https://akgec-edu.onrender.com/v1/student/profile/parentinfo');
  Map<String, dynamic>? parentsInfo;

  @override
  void initState() {
    super.initState();
    _fetchParentInfo();
  }

  Future<void> _fetchParentInfo() async {
    try {
      final token =
          '${PreferencesManager().token}'; // Replace with your actual token
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
      appBar: AppBar(title: Text("Parent Info"),),
      body: parentsInfo != null
          ? ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(
                        title: 'Father Name', value: parentsInfo!['fatherName']),
                    buildInfoItem(
                        title: 'Mother Name', value: parentsInfo!['motherName']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(
                        title: 'Father Mobile No.',
                        value: parentsInfo!['fatherMobNo']),
                    buildInfoItem(
                        title: 'Mother Mobile No.',
                        value: parentsInfo!['motherMobNo']),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(
                        title: 'Father Email', value: parentsInfo!['emailFather']),
                    buildInfoItem(
                        title: 'Mother Email', value: parentsInfo!['emailMother']),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(
                        title: 'Father Aadhar No.',
                        value: parentsInfo!['aadharNoFather']),
                    buildInfoItem(
                        title: 'Mother Aadhar No.',
                        value: parentsInfo!['aadharNoMother']),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(
                        title: 'Father Occupation',
                        value: parentsInfo!['occupationFather']),
                    buildInfoItem(
                        title: 'Mother Occupation',
                        value: parentsInfo!['occupationMother']),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildInfoItem(title: 'Address', value: parentsInfo!['address']),
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

//  Widget buildInfoItem({required String title, required String value}) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 15,
//               fontWeight: FontWeight.w500,
//               color: Colors.black87,
//             ),
//           ),
//           // SizedBox(height: 4),
//           Container(
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.grey,
//                 width: 1.0,
//               ),
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             padding: EdgeInsets.all(12.0),
//             child: Text(
//               value,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.black54,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
