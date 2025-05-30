import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import '../Screens/Upload/UploadFilePage.dart';

class Subject_Assignment_Card extends StatelessWidget {
  final String subjectName;
  final String status;
  final String assignmentUrl;
  final String assignmentId;

  const Subject_Assignment_Card({
    Key? key,
    required this.subjectName,
    required this.status,
    required this.assignmentUrl,
    required this.assignmentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(15.0),
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 75, 184, 1),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Image.asset("assets/assets/Frame 52.png"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subjectName,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.050,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Status: $status',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // Open URL when clicking on 'View'
                  launch(assignmentUrl);
                },
                child: Text(
                  'View',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 90,
          right: 20,
          child: InkWell(
            onTap: () async {
              // Open file picker when "Upload solution" is tapped
              final file = await pickFile(context);
              if (file != null) {
                // Navigate to UploadFilePage and pass the selected file
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UploadFilePage(selectedFile: file, assignmentId: assignmentId),
                ));
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: Center(
                child: Text(
                  'Upload solution',
                  style: TextStyle(
                    color: const Color.fromRGBO(0, 75, 184, 1),
                    fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  Future<File?> pickFile(BuildContext context) async {
    // Open file picker
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Return the selected file
      return File(result.files.single.path!);
    } else {
      // User canceled the file picker
      return null;
    }
  }
}


