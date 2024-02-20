// import 'package:edumarshals/API_Service/DocummentApi.dart';
// import 'package:edumarshals/Model/Document_Model.dart';
// import 'package:edumarshals/Widget/CustomAppBar.dart';
// import 'package:flutter/material.dart';

// class Document_Screen extends StatefulWidget {
//   const Document_Screen({super.key});

//   @override
//   State<Document_Screen> createState() => _Document_ScreenState();
// }

// class _Document_ScreenState extends State<Document_Screen> {
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: CustomAppBar(userName: "Vidhi gupta"),

//       body: FutureBuilder(

//        future: getdocument(),

//        builder: (context,AsyncSnapshot snapshot){

//         if(snapshot.hasData){
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }

//         else{
          
//         // List<Product> products=snapshot.data;

//         return ListView.builder(
//           itemCount:9,
//           itemBuilder: (BuildContext context,int index){
//             return Card(
//               child: ListTile(
//                 leading: SizedBox(
//                   width: 100,
//                   height: 100,
//                 ),
//                 title: Text("jhgf"),

//               ),
//             );
//           }
//           );
//         }
//        }
//        ),
//     );
//   }
// }
import 'dart:convert';

import 'package:edumarshals/Widget/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DocScreen extends StatefulWidget {
  const DocScreen({super.key});

  @override
  State<DocScreen> createState() => _DocScreenState();
}

class _DocScreenState extends State<DocScreen> {
   late String tenthMarksheetUrl='';
  late String studentPhotoUrl='';
  @override
  void initState() {
    super.initState();
    fetchDocuments();
  }

  Future<void> fetchDocuments() async {
  try {
    final response = await http.get(Uri.parse('https://akgec-edu.onrender.com/v1/student/profile/documents'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        tenthMarksheetUrl = data['documents']['tenthMarksheet'];
        studentPhotoUrl = data['documents']['studentPhoto'];
      });
    } else {
      throw Exception('Failed to load documents: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching documents: $e');
    // Handle the error gracefully, e.g., show an error message to the user.
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(userName: "jhgfx"),
      body: tenthMarksheetUrl.isNotEmpty && studentPhotoUrl.isNotEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  tenthMarksheetUrl,
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20),
                Image.network(
                  studentPhotoUrl,
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      
    );
  }
}