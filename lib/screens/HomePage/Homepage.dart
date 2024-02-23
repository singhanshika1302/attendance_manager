// import 'package:edumarshal/Utilities/Utilities.dart';
import 'package:edumarshals/Utilities/Utilities.dart';
import 'package:edumarshals/main.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
                  child: Icon(Icons.close_sharp, size: 40, color: Color(0xffCFDDF1),),
                ),
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                  Navigator.pop(context);
                },
              ),
              buildDrawerTile(0, 'assets/bank.png', 'Classroom', 'assets/icons/sel_bank.png', 4),
              buildDrawerTile(1, 'assets/icons/buliding.png', 'Hostel', 'assets/icons/sel_building.png', 4),
              buildDrawerTile(2, 'assets/icons/teacher.png', 'Placement', 'assets/icons/sel_teacher.png', 4),
              buildDrawerTile(3, 'assets/icons/note.png', 'PYQS Papers', 'assets/icons/sel_note.png', 3.7),
              buildDrawerTile(4, 'assets/icons/fees.png', 'Fees', 'assets/icons/sel_fees.png', 3.7),
              buildDrawerTile(5, 'assets/icons/events.png', 'Events', 'assets/icons/sel_events.png', 4)
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
                                onTap: (){
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                                child: Image.asset('assets/Group 48065.png',scale: 3,)),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Image.asset('assets/Ellipse 7.png',scale: 3.5,),
                            ),
                             Text(PreferencesManager().name,style: TextStyle(
                                fontSize: 15
                            ),),
                          ],
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey
                            ),
                            shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Image.asset('assets/icons/Bell.png',scale: 2.5,),
                        ),
                      ),


                    ],
                  ),

                  SizedBox(height: sheight * 0.03,),

                  Container(
                    height: sheight * 0.18,
                    decoration: BoxDecoration(
                      color: const Color(0xff004BB8),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Overall Attendance', style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),),

                              SizedBox(height: sheight * 0.01,),

                              const Text('including all subjects\nand labs.',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400
                                ),)
                            ],
                          ),

                          CircularPercentIndicator(
                            radius: 41.0,
                            lineWidth: 15.0,
                            percent: 0.809,
                            // header: Text("Icon header"),
                            center: const Text("80.9%",
                              style: TextStyle(color: Colors.white),),
                            backgroundColor: const Color.fromRGBO(0, 75, 184, 1),
                            progressColor: const Color(0xff00CE46),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: sheight * 0.033,),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('All Subjects', style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),),

                      Text('View All', style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff004BB8)
                      ),)
                    ],
                  ),

                  SizedBox(height: sheight * 0.013,),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      height: sheight * 0.15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AttIndicator(0.809, '80.9%', 'COA'),
                          SizedBox(width: swidth * 0.04,),
                          AttIndicator(0.705, '70.5%', 'DS'),
                          SizedBox(width: swidth * 0.04,),
                          AttIndicator(0.75, '75%', 'PYTHON'),
                          SizedBox(width: swidth * 0.04,),
                          AttIndicator(0.909, '90.9%', 'DSTL'),
                          SizedBox(width: swidth * 0.04,),
                          AttIndicator(0.89, '89%', 'UHV'),
                          SizedBox(width: swidth * 0.04,),
                          AttIndicator(0.65, '65%', 'COA LAB'),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: sheight * 0.015,),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recent Class Notes', style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),),

                      Text('View All', style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff004BB8)
                      ),)
                    ],
                  ),

                  SizedBox(height: sheight * 0.03,),

                  notes('Mathematics - IV', 'Statical Techinque I', 'By Meenakshi Ma`am'),

                  notes('Mathematics - IV', 'Statical Techinque I', 'By Meenakshi Ma`am'),

                  notes( 'Mathematics - IV', 'Statical Techinque I',
                      'By Meenakshi Ma`am'),


                  const Text('Assignment',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),),

                  SizedBox(height: sheight * 0.025,),

                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff004BB8),
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:  EdgeInsets.only(bottom: 10),
                            child:  Text('Mathematics', style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500
                            ),),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(right: 15),
                                     child: Image.asset('assets/Frame 50.png', scale: 3.5,),
                                   ),

                                   const Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text('Minakshi Ma`am', style: TextStyle(
                                           fontSize: 18,
                                           color: Colors.white
                                       ),),

                                       Text('Assistant Professor', style: TextStyle(
                                           fontSize: 14,
                                           color: Colors.white
                                       ),),
                                     ],
                                   ),
                                 ],
                               ),

                                const Text('View All', style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white
                                ),)
                              ],
                            ),
                          ),

                          Asgn('Statical Technique II',
                              'Status - Pending', '4:30 PM'),

                          Asgn( 'Statical Technique I',
                              'Status - Completed', '2 Week Ago'),
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
        borderRadius: BorderRadius.circular(
            10.0), // Adjust the border radius as needed
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      // Adjust the vertical margin as needed
      child: ListTile(
        leading: Image.asset(
          index == selectedTileIndex ? selectedImage : defaultImage,
          scale: scale,),
        title: Text(
          title,
          style: TextStyle(
            color: index == selectedTileIndex ? const Color.fromRGBO(0, 75, 184, 0.92) : const Color.fromRGBO(235, 243, 255, 0.92),
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
          //     Navigator.push(context, MaterialPageRoute(builder: (context) => ClassroomPage()));
          //     break;
          //   case 1:
          //     Navigator.push(context, MaterialPageRoute(builder: (context) => HostelPage()));
          //     break;
          // }
        },
      ),
    );
  }
}


