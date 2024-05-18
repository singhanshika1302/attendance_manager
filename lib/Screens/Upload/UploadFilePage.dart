import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:image/image.dart' as img;
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

// UploadFilePage widget to display the selected file and an upload button
class UploadFilePage extends StatelessWidget {
  final File? selectedFile;
  final String assignmentId;

  const UploadFilePage(
      {Key? key, this.selectedFile, required this.assignmentId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload File'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (selectedFile != null) ...[
              SizedBox(height: 20),
              // Render different widgets based on file format
              _renderFileWidget(selectedFile!),
              SizedBox(height: 20),
              // Upload button
              ElevatedButton(
                onPressed: () async {
                  // Get the access token from SharedPreferences
                  String? accessToken = PreferencesManager().token;

                  if (accessToken != null && accessToken.isNotEmpty) {
                    // Access token is available, proceed with the upload

                    if (assignmentId.isNotEmpty) {
                      // Upload the file for the specific assignment ID
                      await _uploadFile(context, accessToken, assignmentId);
                    } else {
                      // No assignment ID provided
                      print('No assignment ID provided');
                    }
                  } else {
                    // Access token is not available
                    print('Access token is not available');
                  }
                },

                child: Text('Upload'),
              ),

            ] else
              ...[
                // If no file is selected
                Text(
                  'No file selected',
                  style: TextStyle(fontSize: 18),
                ),
              ],
          ],
        ),
      ),
    );
  }

  // Function to render different widgets based on file format
  Widget _renderFileWidget(File file) {
    if (file.path.toLowerCase().endsWith('.pdf')) {
      // If file is PDF, display using PDF viewer
      return Expanded(
        child: PDFView(
          filePath: file.path,
          enableSwipe: true,
          swipeHorizontal: true,
          autoSpacing: false,
          pageFling: false,
        ),
      );
    } else if (file.path.toLowerCase().endsWith('.jpeg') ||
        file.path.toLowerCase().endsWith('.jpg') ||
        file.path.toLowerCase().endsWith('.png')) {
      // If file is an image, display the image
      return Expanded(
        child: Image.file(
          file,
          fit: BoxFit.contain,
        ),
      );
    } else {
      // If file format is not supported, display a message
      return Text(
        'File format not supported',
        style: TextStyle(fontSize: 18),
      );
    }
  }

  Future<void> _uploadFile(BuildContext context, String accessToken,
      String assignmentId) async {
    try {
      // Prepare the multipart request with the assignment ID included in the URL
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://akgec-edu.onrender.com/v1/student/assignment/uploadSolution?assignmentId=$assignmentId'),
      );

      // Add the access token to the request headers
      request.headers.addAll({'Cookie': 'accessToken=$accessToken'});

      // Add the file to the request
      request.files.add(
        await http.MultipartFile.fromPath('document', selectedFile!.path),
      );

      // Send the request
      var response = await request.send();

      // Check the response status
      if (response.statusCode == 200) {
        // Request was successful, handle the response
        print('Upload successful for assignment ID: $assignmentId');
        // Show a success message to the user if needed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
              'File uploaded successfully for assignment ID: $assignmentId')),
        );
      } else {
        // Request failed, handle the error
        print(
            'Failed to upload for assignment ID: $assignmentId. Status code: ${response
                .statusCode}');
      }
    } catch (e) {
      // Handle any exceptions
      print('Error uploading for assignment ID: $assignmentId. Error: $e');
    }
  }
}