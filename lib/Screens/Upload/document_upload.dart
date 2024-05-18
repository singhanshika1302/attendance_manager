// import 'dart:convert';
// import 'dart:io';

// // import 'package:flutter_full_pdf_viewer_null_safe/full_pdf_viewer_scaffold.dart';
// import 'package:dotted_border/dotted_border.dart';
// // import 'package:edumarshals/Screens/Attendance/OverAllAttendance.dart';
// // import 'package:edumarshals/Screens/User_Info/Document/Document_Image.dart';
// // import 'package:edumarshals/Widget/My_Document_View_Card.dart';
// // import 'package:edumarshals/repository/Document_Repo.dart';
// import 'package:edumarshals/Widget/CustomAppBar.dart';
// import 'package:edumarshals/main.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';

// class uploadDocument extends StatefulWidget {
//   const uploadDocument({Key? key}) : super(key: key);

//   @override
//   State<uploadDocument> createState() => _uploadDocumentState();
// }

// class _uploadDocumentState extends State<uploadDocument> {
//   // final DocumentRepository _documentRepository = DocumentRepository();
//   bool _isLoading = false;
//   // File? _aadharImage;
//   // File? _importantDocumentImage;

//   File? _image;
//   Future _getImageFromCamera() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.camera);

//     setState(() {
//       _image = pickedFile != null ? File(pickedFile.path) : null;
//     });
//   }

//   Future _getImageFromGallery() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);

//     setState(() {
//       _image = pickedFile != null ? File(pickedFile.path) : null;
//     });
//   }

//   Future<void> _uploadImage(String? imagePath) async {
//     setState(() {
//       _isLoading = true;
//     });

//     // String? accessToken = await getAccessToken();

//     // if (accessToken == null) {
//     //   return;
//     // }

//     final url = Uri.parse(
//         'https://akgec-edu.onrender.com/v1/student/profile/document?documentType=studentPhoto');
//     var request = http.MultipartRequest('POST', url);
//     request.headers['Cookie'] = 'accessToken=${PreferencesManager().token}';
//     print('${PreferencesManager().token}');
//     // print('${widget.acknowledgementNumber}');

//     if (imagePath != null) {
//       request.files.add(
//           await http.MultipartFile.fromPath('nationalIdCard', _image!.path));
//     }

//     try {
//       final response = await request.send();

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData =
//             json.decode(await response.stream.bytesToString());
//         final message = responseData['message'];
//         print('Message from API documentUpload: $message');
//         // print('acknowlwdgementNumber: ${widget.acknowlwdgementNumber}');

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(message),
//             duration: const Duration(seconds: 3),
//           ),
//         );
//         setState(() {
//           _isLoading = false;
//         });
//         // Continue with your navigation or other actions
//       } else {
//         print('Failed: ${response.statusCode}');

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//                 'Failed to upload document. Status Code: ${response.statusCode}'),
//             duration: const Duration(seconds: 3),
//           ),
//         );
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       print('Error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error uploading document'),
//           duration: const Duration(seconds: 3),
//         ),
//       );
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenwidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(235, 243, 255, 1),
//    appBar: CustomAppBar(userName: PreferencesManager().name,
//    userImage: PreferencesManager().studentPhoto,
//     onTap:
//     (){
//               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => uploadDocument()));

//     }
//      ),
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: screenHeight * 0.06,
//             ),
//             DottedBorder(
//                 strokeWidth: 1.5,
//                 dashPattern: [4, 4],
//                 radius: Radius.circular(10),
//                 child: Container(
//                   height: screenHeight * 0.4,
//                   width: screenwidth * 0.8,
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Image.asset(
//                           'assets/Ellipse 7.jpg',
//                           scale: 4.5,
//                         ),
//                         const Text(
//                           'Drag or Drop file here',
//                           style: TextStyle(
//                             // fontFamily: ,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'Poppins',
//                             color: const Color.fromARGB(255, 10, 10, 10),
//                             fontSize: 20,
//                             fontStyle: FontStyle.normal,
//                           ),
//                         ),
//                         const Text(
//                           '-OR-',
//                           style: TextStyle(
//                             // fontFamily: ,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'Poppins',
//                             color: const Color.fromARGB(255, 10, 10, 10),
//                             fontSize: 20,
//                             fontStyle: FontStyle.normal,
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: () async {
//                             _showImagePickerDialog(context);
//                           },
//                           style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.all<Color>(
//                                   Color.fromRGBO(0, 75, 184, 1))),
//                           child: const Text(
//                             'Choose File',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ]),
//                 )),
//             SizedBox(
//               height: screenHeight * 0.29,
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 _uploadImage(_image?.path);
//               },
//               style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all<Color>(
//                       Color.fromRGBO(0, 75, 184, 1))),
//               child: const Text(
//                 'Upload File',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showImagePickerDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Select Image Source'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: Icon(Icons.camera),
//                 title: Text('Camera'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   _getImageFromCamera();
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.image),
//                 title: Text('Gallery'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   _getImageFromGallery();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }


import 'dart:convert';
import 'dart:io';

// import 'package:flutter_full_pdf_viewer_null_safe/full_pdf_viewer_scaffold.dart';
import 'package:edumarshals/main.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
// import 'package:edumarshals/Screens/Attendance/OverAllAttendance.dart';
// import 'package:edumarshals/Screens/User_Info/Document/Document_Image.dart';
// import 'package:edumarshals/Widget/My_Document_View_Card.dart';
// import 'package:edumarshals/repository/Document_Repo.dart';
// import 'package:edumarshals/Widget/CustomAppBar.dart';
// import 'package:edumarshals/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class uploadDocument extends StatefulWidget {
  const uploadDocument({Key? key}) : super(key: key);

  @override
  State<uploadDocument> createState() => _uploadDocumentState();
}

class _uploadDocumentState extends State<uploadDocument> {
  bool _isLoading = false;

  File? _image;
  final picker = ImagePicker();
  Future _getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  Future _getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  Future<void> _uploadImage(String? imagePath) async {
    final dio = Dio(); // Create a Dio instance

    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse(
        'https://akgec-edu.onrender.com/v1/student/profile/document?documentType=studentPhoto');
    // final formData = FormData.fromMap({
    //   'Cookie': 'accessToken=${PreferencesManager().token}', // Add cookie to FormData
    // });
    final formData = FormData.fromMap({});

    if (imagePath != null) {
      
      print("hi");
      final imageFile = await MultipartFile.fromFile(imagePath,);
      print(imagePath);
      print(imageFile);
      final fileEntry = MapEntry('document', imageFile); // Create a MapEntry
      formData.files.add(fileEntry);
    }
    final options = Options(
      validateStatus: (status) => status! <= 500,
      headers: {'Cookie': 'accessToken=${PreferencesManager().token}'},
    );

    try {
      final response = await dio.post("$url", data: formData, options: options);

      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        final message = responseData['message'];
        print('Message from API documentUpload: $message');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 3),
          ),
        );

        setState(() {
          _isLoading = false;
        });

        // Handle successful upload (e.g., navigate to a confirmation screen)
      } else if (response.statusCode == 400) {
        print('Error Response: ${response.data}');
        final errorResponseData = response.data as Map<String, dynamic>;
        final errorMessage =
            errorResponseData['error'] ?? 'Failed to upload document';
        print('Error message from API: $errorMessage');
        print('Failed: ${response.statusCode}');
        // final errorMessage =
        //     response.data['error'] ?? 'Failed to upload document';

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            duration: const Duration(seconds: 3),
          ),
        );

        setState(() {
          _isLoading = false;
        });
      }
    } on DioError catch (e) {
      print('Error: $e');
      final errorMessage = e.error ?? 'Error uploading document';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("$errorMessage"),
          duration: const Duration(seconds: 3),
        ),
      );

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      // Handle other exceptions (e.g., network errors)
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An unexpected error occurred'),
          duration: const Duration(seconds: 3),
        ),
      );

      setState(() {
        _isLoading = false;
      });
    }
  }

  // Future<void> _uploadImage(String? imagePath) async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   final url = Uri.parse(
  //       'https://akgec-edu.onrender.com/v1/student/profile/document?documentType=studentPhoto');
  //   var request = http.MultipartRequest('POST', url);
  //   request.headers
  //       .addAll({'Cookie': 'accessToken=${PreferencesManager().token}'});
  //   // headers:
  //   // <String, String>{
  //   //   'Content-Type': 'application/json',
  //   //   'Cookie': 'accessToken=${PreferencesManager().token}'
  //   // };
  //   print('${PreferencesManager().token}');
  //   // print('${widget.acknowledgementNumber}');

  //   if (imagePath != null) {
  //     print("imagePath: $imagePath");
  //     request.files
  //         .add(await http.MultipartFile.fromPath('document', _image!.path));
  //   }

  //   try {
  //     final response = await request.send();

  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> responseData =
  //           json.decode(await response.stream.bytesToString());
  //       final message = responseData['message'];
  //       print('Message from API documentUpload: $message');
  //       // print('acknowlwdgementNumber: ${widget.acknowlwdgementNumber}');

  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(message),
  //           duration: const Duration(seconds: 3),
  //         ),
  //       );
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       // Continue with your navigation or other actions
  //     } else {
  //       print('Failed: ${response.statusCode}');

  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(
  //               'Failed to upload document. Status Code: ${response.statusCode}'),
  //           duration: const Duration(seconds: 3),
  //         ),
  //       );
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Error uploading document'),
  //         duration: const Duration(seconds: 3),
  //       ),
  //     );
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 243, 255, 1),
      //  appBar: CustomAppBar(userName: PreferencesManager().name,
      //  userImage: PreferencesManager().studentPhoto,
      //   onTap:
      //   (){
      //             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => uploadDocument()));

      //   }
      //    ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.06,
            ),
            DottedBorder(
                strokeWidth: 1.5,
                dashPattern: [4, 4],
                radius: Radius.circular(10),
                child: Container(
                  height: screenHeight * 0.4,
                  width: screenwidth * 0.8,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/Ellipse 7.jpg',
                          scale: 4.5,
                        ),
                        const Text(
                          'Drag or Drop file here',
                          style: TextStyle(
                            // fontFamily: ,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: const Color.fromARGB(255, 10, 10, 10),
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        const Text(
                          '-OR-',
                          style: TextStyle(
                            // fontFamily: ,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: const Color.fromARGB(255, 10, 10, 10),
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            _showImagePickerDialog(context);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(0, 75, 184, 1))),
                          child: const Text(
                            'Choose File',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ]),
                )),
            SizedBox(
              height: screenHeight * 0.29,
            ),
            ElevatedButton(
              onPressed: () async {
                _uploadImage(_image?.path);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(0, 75, 184, 1))),
              child: const Text(
                'Upload File',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showImagePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _getImageFromCamera();
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _getImageFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
