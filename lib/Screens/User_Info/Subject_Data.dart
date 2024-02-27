import 'package:edumarshals/Model/Subject_Model.dart';
import 'package:edumarshals/Screens/User_Info/Profile.dart';
import 'package:edumarshals/main.dart';
import 'package:edumarshals/repository/Subject_Repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Subjectdata extends StatefulWidget {
  const Subjectdata({Key? key});

  @override
  State<Subjectdata> createState() => _SubjectdataState();
}

class _SubjectdataState extends State<Subjectdata> {
  final SubjectRepository _subjectRepository = SubjectRepository();
  late Future<List<Subject>> _subjectsFuture;

  @override
  void initState() {
    super.initState();
    _subjectsFuture = _subjectRepository.fetchSubjects();
    // print(PreferencesManager().semester);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 246, 255, 1),
      appBar: AppBar(
        
        title:  Center(
          child: Column(
            children: [
              CircleAvatar(
                // backgroundColor: Color.fromARGB(255, 194, 33, 243),
                backgroundImage: AssetImage("assets/assets/Frame 48117 (2).png"),
                
              ),
              Text("Semester ${PreferencesManager().sem}",style: GoogleFonts.poppins(fontSize: 20),)
            ],
          ),
        ),
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 255, 253, 248),
      ),
      body: FutureBuilder<List<Subject>>(
        future: _subjectsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Subject> subjects = snapshot.data!;
            return Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Profile()));
                    }, icon: const Icon(Icons.arrow_back)),
                    const Text("Subject", style: TextStyle(fontSize: 20)),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: subjects.length,
                    itemBuilder: (context, index) {
                      return buildSubjectContainer(context, subjects[index].name);
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

Widget buildSubjectContainer(BuildContext context, String text) {
  // final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  return Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    padding: const EdgeInsets.all(16),
    width: screenWidth,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      text,
      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
    ),
  );
}
