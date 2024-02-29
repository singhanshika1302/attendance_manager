import 'package:flutter/material.dart';
import 'package:edumarshals/Utilities/Utilities.dart';
import 'package:edumarshals/Widget/CustomAppBar.dart';
import 'package:edumarshals/Repository/classnotes_Repo.dart'; // Import the ClassNotesRepository
import 'package:edumarshals/Model/classnotes_Model.dart'; // Import the ClassNotes model
import '../../main.dart';
import 'package:url_launcher/url_launcher.dart';


class ClassNotesPage extends StatefulWidget {
  const ClassNotesPage({Key? key}) : super(key: key);

  @override
  State<ClassNotesPage> createState() => _ClassNotesPageState();
}

class _ClassNotesPageState extends State<ClassNotesPage> {
  int current = 0;

  Future<List<ClassNotes>> fetchClassNotes() async {
    try {
      final repository = ClassNotesRepository();
      final response = await repository.fetchClassNotes();

      // Print the entire response body to the terminal
      print('Response Body:');
      for (var classNote in response!) {
        print('Subject: ${classNote.subject?.name}');
        print('Classnotes URL: ${classNote.classNotesUrl}');
        print('Teacher: ${classNote.teacher?.name}');
        print('---');
      }

      return response;
    } catch (e) {
      print('Error fetching class notes: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final sheight = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffEBF3FF),
      appBar: CustomAppBar(userName: PreferencesManager().name),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    ChoiceChip(
                      selected: current == 0,
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'All Class Notes',
                          style: TextStyle(
                              color: current == 0 ? Colors.white : Colors.black, fontSize: 12),
                        ),
                      ),
                      selectedColor: Color(0xFF004BB8),
                      backgroundColor: current == 0 ? Color(0xFF004BB8) : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onSelected: (selected) {
                        setState(() {
                          current = (selected ? 0 : null)!;
                        });
                      },
                      showCheckmark: false,
                    ),
                    SizedBox(width: 20),
                    ChoiceChip(
                      selected: current == 1,
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Recent Class Notes',
                          style: TextStyle(
                              color: current == 1 ? Colors.white : Colors.black, fontSize: 12),
                        ),
                      ),
                      selectedColor: Color(0xFF004BB8),
                      backgroundColor: current == 1 ? Color(0xFF004BB8) : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onSelected: (selected) {
                        setState(() {
                          current = (selected ? 1 : null)!;
                        });
                      },
                      showCheckmark: false,
                    ),
                  ],
                ),
                SizedBox(height: sheight * 0.03),
                FutureBuilder<List<ClassNotes>>(
                  future: fetchClassNotes(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Text('No class notes available.');
                    } else {
                      return Column(
                        children: [
                          for (var classNote in snapshot.data!)
                            AllClassNotesBlock(
                              classNote.subject?.name ?? '',
                              classNote.teacher?.name ?? '',
                              classNote.classNotesUrl ?? '',
                            ),

                        ],


                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget AllClassNotesBlock(String subjectName, String teacherName, String classNotesUrl) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: GestureDetector(
      onTap: () {
        // Open the URL when the image is tapped
        launch(classNotesUrl);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF004BB8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      subjectName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text(
                      'Semester - 3',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                  Text(
                    teacherName,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )
                ],
              ),
              Image.asset('assets/note-2.png', scale: 4),
            ],
          ),
        ),
      ),
    ),
  );
}