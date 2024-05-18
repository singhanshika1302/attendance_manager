// import 'package:edumarshals/Utilities/Utilities.dart';
// import 'dart:html';

// import 'package:edumarshals/Screens/Attendance/OverAllAttendance.dart';
// import 'package:edumarshals/Screens/Events_Page.dart';

import 'package:edumarshals/Model/assignment_Model.dart';
import 'package:edumarshals/Model/student_attendance_data_model.dart';
import 'package:edumarshals/Screens/Attendance/OverAllAttendance.dart';
import 'package:edumarshals/Screens/Events/Events_Page.dart';
import 'package:edumarshals/Screens/Notes_Assignment/ClassNotesPage.dart';
import 'package:edumarshals/Screens/Notes_Assignment/Subject_Assignment.dart';
import 'package:edumarshals/Screens/User_Info/Profile.dart';
import 'package:edumarshals/Utils/Utilities/Utilities.dart';
import 'package:edumarshals/Widget/AttendanceCard.dart';
import 'package:edumarshals/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:edumarshals/repository/assignment_Repository.dart';
import 'package:edumarshals/repository/overall_attendance_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../../Model/classnotes_Model.dart';
import '../../Utils/floating_action _button.dart';
import 'package:edumarshals/repository/classnotes_Repo.dart';

import '../../Widget/CommonDrawer.dart';
import '../../Widget/CustomAppBar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

final _key = GlobalKey<ExpandableFabState>();

class _HomepageState extends State<Homepage> {
  List<StudentAttendanceData>? _attendanceDataList;
  final GlobalKey<ScaffoldState> scaffoldKey_ = GlobalKey<ScaffoldState>();
  int selectedTileIndex = -1;
  final AssignmentRepository _assignmentRepository = AssignmentRepository();
  final ClassNotesRepository _classNotesRepository = ClassNotesRepository();
  final AttendanceRepository _repository = AttendanceRepository();
  @override
  void initState() {
    super.initState();
    _fetchAttendanceData();
  }

  //.............calling attendance repository ...................................//
  Future<void> _fetchAttendanceData() async {
    List<StudentAttendanceData>? attendanceDataList =
        await _repository.fetchAttendance();
    int totalClasses = 0;
    int totalPresentClasses = 0;
//...............function to store total present and total classes .............//
    if (attendanceDataList != null) {
      for (var data in attendanceDataList) {
        totalClasses += data.totalClasses ?? 0;
        totalPresentClasses += data.totalPresent ?? 0;
      }
    }
    setState(() {
      _attendanceDataList = attendanceDataList;
      // _totalClasses = totalClasses;
      // print('totalclasses${_totalClasses}');
      // // PreferencesManager.totalclasses=_totalClasses;
      // // print('totalPresentClasses${_totalPresentClasses}');
      // _totalPresentClasses = totalPresentClasses;

      // PreferencesManager().totalclasses = _totalClasses;
      // PreferencesManager().presentclasses = _totalPresentClasses;

      // print('totalPresentClasses${_totalPresentClasses}');

      // // print('dfghj $attendanceDataList');
      // // PreferencesManager.totalclasses=_totalClasses;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sheight = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: custom_floating_action_button(Gkey: _key),
      key: scaffoldKey_,
      backgroundColor: const Color(0xffEBF3FF),
      appBar: CustomAppBar(
        userName: PreferencesManager().name,
        userImage: PreferencesManager().studentPhoto,
        onTap: () {
          scaffoldKey_.currentState?.openDrawer();
        },
        scaffoldKey_: scaffoldKey_, // Pass the _scaffoldKey
      ),
      drawer: CommonDrawer(
        scaffoldKey_: scaffoldKey_, currentIndex: 0, // Pass the _scaffoldKey
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AttendanceCard(
                    title: "Overall Attendance",
                    description: "including all subjects\nand labs.",
                    attendedClasses: PreferencesManager().presentclasses,
                    totalClassess: PreferencesManager().totalclasses),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Subjects',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      child: Text(
                        'View All',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff004BB8)),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventsPage())),
                    )
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: sheight * 0.15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
//                         Container(
//                           height: 100,
//                           width: 900,
//                           child: _attendanceDataList != null
//                               ? Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Expanded(
//                                       child: ListView.builder(
//                                         scrollDirection: Axis.horizontal,
//                                         itemCount: _attendanceDataList!.length,
//                                         itemBuilder: (context, index) {
//                                           final attendanceData =
//                                               _attendanceDataList![index];
// //.......................assigning subject attendace to the SubjectAttendaceCard......//
//                                           return AttIndicator({
//                                             (attendanceData.totalPresent! /
//                                                 attendanceData.totalClasses!)
//                                           }, '${(attendanceData.totalPresent! / attendanceData.totalClasses! * 100).toStringAsFixed(1)}%',
//                                               '${attendanceData.subject}');
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               : Center(
//                                   child: SizedBox(
//                                     height: 50, // Adjust the height as needed
//                                     width: 50, // Adjust the width as needed
//                                     child: CircularProgressIndicator(),
//                                   ),
//                                 ),
//                         ),
                        AttIndicator(0.809, '80.9%', 'COA'),
                        SizedBox(
                          width: swidth * 0.04,
                        ),
                        AttIndicator(0.705, '70.5%', 'DS'),
                        SizedBox(
                          width: swidth * 0.04,
                        ),
                        AttIndicator(0.75, '75%', 'PYTHON'),
                        SizedBox(
                          width: swidth * 0.04,
                        ),
                        AttIndicator(0.909, '90.9%', 'DSTL'),
                        SizedBox(
                          width: swidth * 0.04,
                        ),
                        AttIndicator(0.89, '89%', 'UHV'),
                        SizedBox(
                          width: swidth * 0.04,
                        ),
                        AttIndicator(0.65, '65%', 'COA LAB'),
                      ],
                    ),
                  ),
                ),
                FutureBuilder<List<ClassNotes>?>(
                  future: _classNotesRepository.fetchClassNotes(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      // If there are no class notes, you can display a message or hide this section
                      return const SizedBox.shrink();
                    } else {
                      final List<ClassNotes> recentClassNotes =
                          snapshot.data!.take(3).toList();
                      // Display class notes here
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Recent Class Notes',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ClassNotesPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'View All',
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xff004BB8)),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Create notes widget for each class note
                          for (var classNote in recentClassNotes)
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ClassNotesPage(),
                                  ),
                                );
                              },
                              child: notes(
                                classNote.subject?.name ?? '',
                                'Semester-3',
                                classNote.teacher?.name ?? '',
                              ),
                            ),
                        ],
                      );
                    }
                  },
                ),
                FutureBuilder<List<Assignment>>(
                  future: _assignmentRepository.fetchAssignments(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      // If there are no assignments, you can display a message or hide this section
                      return const SizedBox.shrink();
                    } else {
                      // Group assignments by subjects
                      final Map<String, List<Assignment>> groupedAssignments =
                          groupAssignmentsBySubject(snapshot.data!);

                      // Display assignments here
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Assignments',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                child: Text(
                                  'View All',
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xff004BB8)),
                                ),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Subject_Assignment(),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Create AssignmentCard for each subject
                          for (String subject in groupedAssignments.keys)
                            AssignmentCard(
                              subjectName: subject,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Subject_Assignment(),
                                  ),
                                );
                                // Handle assignment tap
                                // You can navigate to a detailed assignment page or perform other actions
                              },
                              assignments: groupedAssignments[subject]!,
                              description: groupedAssignments[subject]!
                                      .first
                                      .description ??
                                  '',
                              deadline:
                                  groupedAssignments[subject]!.first.deadline ??
                                      '',
                              teacherName: groupedAssignments[subject]!
                                      .first
                                      .teacher
                                      ?.name ??
                                  '',
                            ),
                        ],
                      );
                    }
                  },
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }

  Widget buildDrawerTile(int index, String defaultImage, String title,
      String selectedImage, double scale) {
    return Container(
      decoration: BoxDecoration(
        color: index == selectedTileIndex ? Colors.white : null,
        borderRadius:
            BorderRadius.circular(10.0), // Adjust the border radius as needed
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
// Adjust the vertical margin as needed
      child: ListTile(
        leading: Image.asset(
          index == selectedTileIndex ? selectedImage : defaultImage,
          scale: scale,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: index == selectedTileIndex
                ? const Color.fromRGBO(0, 75, 184, 0.92)
                : const Color.fromRGBO(235, 243, 255, 0.92),
            fontSize: 20,
          ),
        ),
        onTap: () {
          setState(() {
            selectedTileIndex = index;
          });
          scaffoldKey_.currentState?.openDrawer();
          Navigator.pop(context);
          switch (index) {
            case 0:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
              break;
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EventsPage()));
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EventsPage()));
              break;
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EventsPage()));
              break;
            case 4:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EventsPage()));
              break;
            case 5:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EventsPage()));
              break;
          }
        },
      ),
    );
  }
}

Map<String, List<Assignment>> groupAssignmentsBySubject(
    List<Assignment> assignments) {
  final Map<String, List<Assignment>> groupedAssignments = {};

  for (Assignment assignment in assignments) {
    final String subjectName = assignment.subject?.name ?? 'Unknown';

    if (!groupedAssignments.containsKey(subjectName)) {
      groupedAssignments[subjectName] = [];
    }

    groupedAssignments[subjectName]!.add(assignment);
  }

  return groupedAssignments;
}

class AssignmentCard extends StatelessWidget {
  final String subjectName;
  final String description;
  final String deadline;
  final String teacherName;
  final VoidCallback onTap;

  const AssignmentCard({
    required this.subjectName,
    required this.description,
    required this.deadline,
    required this.teacherName,
    required this.onTap,
    required List<Assignment> assignments,
  });

  @override
  Widget build(BuildContext context) {
    final sheight = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Color(0xff004BB8),
// margin: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$subjectName',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Image.asset(
                      'assets/arrow-up.png',
                      scale: 4,
                    )
                  ],
                ),

                SizedBox(
                  height: sheight * 0.01,
                ),
                // Text('Description: $description'),
                // Text('Deadline: $deadline'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/Frame 50.png',
                      scale: 4,
                    ),
                    SizedBox(
                      width: swidth * 0.03,
                    ),
                    Text(
                      '$teacherName',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
