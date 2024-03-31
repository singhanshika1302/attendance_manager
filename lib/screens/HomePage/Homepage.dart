// import 'package:edumarshal/Utilities/Utilities.dart';
// import 'dart:html';

import 'package:edumarshals/Screens/Attendance/OverAllAttendance.dart';
import 'package:edumarshals/Screens/Events/Events_Page.dart';
import 'package:edumarshals/Screens/User_Info/Profile.dart';
import 'package:edumarshals/Utils/Utilities/Utilities.dart';
import 'package:edumarshals/Widget/AttendanceCard.dart';
import 'package:edumarshals/main.dart';
import 'package:flutter/material.dart';
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
                                builder: (context) => OverAllAttd())),
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

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Class Notes',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'View All',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff004BB8)),
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

                  const Text(
                    'Assignment',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(
                    height: sheight * 0.025,
                  ),

                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff004BB8),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Mathematics',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 15),
                                      child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/Ellipse 7.jpg")),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Minakshi Ma`am',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Assistant Professor',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  'View All',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Asgn('Statical Technique II', 'Status - Pending',
                              '4:30 PM'),
                          Asgn('Statical Technique I', 'Status - Completed',
                              '2 Week Ago'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => EventsPage()));
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
