// import 'package:edumarshals/Utilities/Utilities.dart';
// import 'dart:html';

// import 'package:edumarshals/Screens/Attendance/OverAllAttendance.dart';
// import 'package:edumarshals/Screens/Events_Page.dart';
import 'package:edumarshals/Screens/Notes_Assignment/ClassNotesPage.dart';
import 'package:edumarshals/Screens/Notes_Assignment/Subject_Assignment.dart';
import 'package:edumarshals/Screens/Events/Events_Page.dart';
import 'package:edumarshals/Screens/User_Info/Profile.dart';
import 'package:edumarshals/Utils/Utilities/Utilities.dart';
import 'package:edumarshals/Widget/AttendanceCard.dart';
import 'package:edumarshals/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edumarshals/Model/assignment_Model.dart';
import 'package:edumarshals/repository/assignment_Repository.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:edumarshals/Screens/Events/Events_Page.dart';

import '../../Model/classnotes_Model.dart';
import '../../Utils/floating_action _button.dart';
import 'package:edumarshals/repository/classnotes_Repo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});


  @override
  State<Homepage> createState() => _HomepageState();
}
final _key = GlobalKey<ExpandableFabState>();
class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedTileIndex = -1;
  final AssignmentRepository _assignmentRepository = AssignmentRepository();
  final ClassNotesRepository _classNotesRepository = ClassNotesRepository();
  @override
  Widget build(BuildContext context) {
    final sheight = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: custom_floating_action_button(Gkey: _key),
      key: _scaffoldKey,
      backgroundColor: const Color(0xffEBF3FF),
      drawer: Drawer(
        backgroundColor: const Color(0xff004BB8),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.close_sharp,
                    size: 40,
                    color: Color(0xffCFDDF1),
                  ),
                ),
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                  Navigator.pop(context);
                },
              ),
              buildDrawerTile(0, 'assets/bank.png', 'Classroom', 'assets/sel_bank.png', 4),
              buildDrawerTile(1, 'assets/buliding.png', 'Hostel', 'assets/sel_building.png', 4),
              buildDrawerTile(2, 'assets/teacher.png', 'Placement', 'assets/sel_teacher.png', 4),
              buildDrawerTile(3, 'assets/note.png', 'PYQS Papers', 'assets/sel_note.png', 3.7),
              buildDrawerTile(4, 'assets/fees.png', 'Fees', 'assets/sel_fees.png', 3.7),
              buildDrawerTile(5, 'assets/events.png', 'Events', 'assets/sel_events.png', 4)

            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    _scaffoldKey.currentState?.openDrawer();
                                  },
                                  child: const Icon(Icons.more_vert)),
                              Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: InkWell(
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          PreferencesManager().studentPhoto),
                                    ),
                                    onDoubleTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Profile()));
                                    },
                                  )),
                              Text(
                                PreferencesManager().name,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              shape: BoxShape.circle),
                          child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(Icons.notifications)),
                        ),
                      ],
                    ),

//  SizedBox(height: sheight * 0.03,),
                    AttendanceCard(
                        title: "Overall Attendance",
                        description: "including all subjects\nand labs.",
                        attendedClasses: PreferencesManager().presentclasses,
                        totalClassess: PreferencesManager().totalclasses),

// Container(
//   height: sheight * 0.18,
//   decoration: BoxDecoration(
//     color: const Color(0xff004BB8),
//     borderRadius: BorderRadius.circular(15.0),
//   ),
//   child: Padding(
//     padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Overall Attendance', style: TextStyle(
//                 fontSize: 22,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold
//             ),),

//             SizedBox(height: sheight * 0.01,),

//             const Text('including all subjects\nand labs.',
//               style: TextStyle(
//                   fontSize: 17,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w400
//               ),)
//           ],
//         ),

//         CircularPercentIndicator(
//           radius: 41.0,
//           lineWidth: 15.0,
//           percent: 0.809,
//           // header: Text("Icon header"),
//           center: const Text("80.9%",
//             style: TextStyle(color: Colors.white),),
//           backgroundColor: const Color.fromRGBO(0, 75, 184, 1),
//           progressColor: const Color(0xff00CE46),
//         ),
//       ],
//     ),
//   ),
// ),

// SizedBox(
//   height: sheight * 0.033,
// ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'All Subjects',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
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

// SizedBox(
//   height: sheight * 0.013,
// ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        height: sheight * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
// SizedBox(
//   height: sheight * 0.015,
// ),

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
                          final List<ClassNotes> recentClassNotes = snapshot.data!.take(3).toList();
                          // Display class notes here
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  Text(
                                    'Recent Class Notes',
                                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                                      style: TextStyle(fontSize: 14, color: Color(0xff004BB8)),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              // Create notes widget for each class note
                              for (var classNote in recentClassNotes)
                                GestureDetector(
                                  onTap:(){
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
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
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
                                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                  ),
                                  TextButton(
                                    child: Text(
                                      'View All',
                                      style: TextStyle(fontSize: 14, color: Color(0xff004BB8)),
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
                                    // Handle assignment tap
                                    // You can navigate to a detailed assignment page or perform other actions
                                  },
                                  assignments: groupedAssignments[subject]!,
                                  description: groupedAssignments[subject]!.first.description ?? '',
                                  deadline: groupedAssignments[subject]!.first.deadline ?? '',
                                  teacherName: groupedAssignments[subject]!.first.teacher?.name ?? '',
                                ),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                )
            ),
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
          _scaffoldKey.currentState?.openDrawer();
          Navigator.pop(context);
          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => EventsPage()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => EventsPage()));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (context) => EventsPage()));
              break;
            case 4:
              Navigator.push(context, MaterialPageRoute(builder: (context) => EventsPage()));
              break;
            case 5:
              Navigator.push(context, MaterialPageRoute(builder: (context) => EventsPage()));
              break;
          }
        },
      ),
    );
  }
}

Map<String, List<Assignment>> groupAssignmentsBySubject(List<Assignment> assignments) {
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
    required this.onTap, required List<Assignment> assignments,
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
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color:Colors.white ),
                    ),

                    Image.asset('assets/arrow-up.png',scale: 4,)
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
                    Image.asset('assets/Frame 50.png',scale: 4,),

                    SizedBox(
                      width: swidth * 0.03,
                    ),

                    Text('$teacherName',style: TextStyle(
                        color: Colors.white
                    ),),
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