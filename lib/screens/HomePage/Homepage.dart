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

import '../../Utils/floating_action _button.dart';

class Homepage extends StatefulWidget {
const Homepage({super.key});

@override
State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
int selectedTileIndex = -1;
final AssignmentRepository _assignmentRepository = AssignmentRepository();

  @override
  Widget build(BuildContext context) {
    final sheight = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: custom_floating_action_button(),
      key: _scaffoldKey,
      backgroundColor: const Color(0xffEBF3FF),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(0, 83, 201, 0.8),
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
              buildDrawerTile(0, 'assets/bank.png', 'Classroom',
                  'assets/assets/bankcolor.png', 1),
              buildDrawerTile(1, 'assets/bank.png', 'Hostel',
                  'assets/assets/buliding.png', 1),
              buildDrawerTile(2, 'assets/note-2.png', 'Placement',
                  'assets/assets/bankcolor.png', 1),
              buildDrawerTile(3, 'assets/bank.png', 'PYQS Papers',
                  'assets/assets/bankcolor.png', 1),
              buildDrawerTile(4, 'assets/card-pos.png', 'Fees',
                  'asset/images/card-poscolor.png', 3),
              buildDrawerTile(5, 'asset/images/ranking.png', 'Events',
                  'assets/rankingcolor.png', 1)
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

Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(
'Recent Class Notes',
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
builder: (context) => ClassNotesPage())),
)
],
),

SizedBox(
height: sheight * 0.03,
),

notes('Mathematics - IV', 'Statical Techinque I',
'By Meenakshi Ma`am'),

notes('Mathematics - IV', 'Statical Techinque I',
'By Meenakshi Ma`am'),

notes('Mathematics - IV', 'Statical Techinque I',
'By Meenakshi Ma`am'),

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
// Display assignments here
final List<Assignment> assignments = snapshot.data!;
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
style:
TextStyle(fontSize: 14, color: Color(0xff004BB8)),
),
onPressed: () => Navigator.push(
context,
MaterialPageRoute(
builder: (context) => Subject_Assignment())),
)
],
),
const SizedBox(height: 8),
for (Assignment assignment in assignments)
AssignmentCard(
subjectName: assignment.subject?.name ?? "",
description: assignment.description ?? "",
deadline: assignment.deadline ?? "",
teacherName: assignment.teacher?.name ?? "",
onTap: () {
// Handle assignment tap
// You can navigate to a detailed assignment page or perform other actions
},
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
// switch (index) {
//   case 0:
//     Navigator.push(context, MaterialPageRoute(builder: (context) => Events_page()));
//     break;
//   case 1:
//     Navigator.push(context, MaterialPageRoute(builder: (context) => Events_page()));
//     break;
// }
},
),
);
}
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
});

@override
Widget build(BuildContext context) {
return GestureDetector(
onTap: onTap,
child: Card(
color: Color(0xff004BB8),
// margin: const EdgeInsets.symmetric(vertical: 8),
child: Padding(
padding: const EdgeInsets.all(16),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'$subjectName',
style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color:Colors.white ),
),
// Text('Description: $description'),
// Text('Deadline: $deadline'),
Text('$teacherName',style: TextStyle(
color: Colors.white
),),
],
),
),
),
);
}
}