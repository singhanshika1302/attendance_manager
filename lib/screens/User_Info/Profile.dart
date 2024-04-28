// import 'package:edumarshal/Widget/Profile_Tabs.dart';
import 'package:edumarshals/Model/time_table_model.dart';
import 'package:edumarshals/Screens/Login/login.dart';
import 'package:edumarshals/Screens/User_Info/Personal_Info/Contact_info_Data.dart';
import 'package:edumarshals/Screens/User_Info/Document/My_Documents_Screen.dart';
import 'package:edumarshals/Screens/User_Info/Personal_Info/Parent_Info_Data.dart';
import 'package:edumarshals/Screens/User_Info/Personal_Info/Personal_Info_Data.dart';
import 'package:edumarshals/Screens/User_Info/Personal_Info/contact_details.dart';
import 'package:edumarshals/Screens/User_Info/Personal_Info/guardian_info.dart';
import 'package:edumarshals/Screens/User_Info/Subject_Data.dart';
import 'package:edumarshals/Screens/time_table.dart';
import 'package:edumarshals/Utils/floating_action%20_button.dart';
import 'package:edumarshals/Widget/Profile_Container.dart';
import 'package:edumarshals/Widget/Profile_Tabs.dart';
import 'package:edumarshals/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_acrylic/flutter_acrylic.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: custom_floating_action_button(),
      backgroundColor: const Color.fromRGBO(235, 243, 255, 1),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent
,
        automaticallyImplyLeading: false,
        toolbarHeight: 190.0, // Adjust the height as needed
        title: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(8)),
               CircleAvatar(
                backgroundImage: NetworkImage(PreferencesManager().studentPhoto),
                backgroundColor: Color.fromARGB(255, 17, 37, 218),
              ),
               Text(PreferencesManager().name),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text(
                       PreferencesManager().studentNumber,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width * 0.03),
                    ),
                  ),
                  Container(
                    child: Text(
                       PreferencesManager().universityRollNumber,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width * 0.03),
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Padding(padding: EdgeInsets.all(8)),
                        Container(
                            margin: const EdgeInsets.all(7),
                            child:
                                Image.asset("assets/assets/Frame 48117.png")),
                        // Icon(Icons.edit),
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.02,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            margin: const EdgeInsets.all(7),
                            child:
                                Image.asset("assets/assets/Frame 48117.png")),

                        // Image.asset("assets/assets/Frame 48117 (1).png"),
                        // Icon(Icons.table_chart),
                        Text(
                          "Achievements",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.02,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            margin: const EdgeInsets.all(7),
                            child: InkWell(
                              onTap: () {
                                
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Subjectdata()));
                              },
                              child: Image.asset(
                                  "assets/assets/Frame 48117 (2).png"),
                            )),

                        // Icon(Icons.hdr_auto_select),
                        Text(
                          "Semester",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.02,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
           Profile_Tab(
            Profileoption: 'Personal Information',
             onpressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  PersonalInfoScreen()));
              // Callback function for IconButton pressed
              print('Arrow Forward Pressed');
            },
            onpressed1: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  PersonalInfoScreen()));
            },
          ),
           Profile_Tab(
            Profileoption: 'Guardian Information',
             onpressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ParentInfoScreen()));
              // Callback function for IconButton pressed
              print('Arrow Forward Pressed');
            },
            onpressed1: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  ParentInfoScreen()));
            },
          ),
          Profile_Tab(
            Profileoption: 'Contact Details',
             onpressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactInfoScreen()));
              // Callback function for IconButton pressed
              print('Arrow Forward Pressed');
            },
            onpressed1: () {
               Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactInfoScreen()));
            },
          ),
          // const Profile_Tab(
          //   Profileoption: 'Education Details',
          // ),
          Profile_Tab(
            Profileoption: 'My Documents',
            onpressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  MyDocument()));
              // Callback function for IconButton pressed
              print('Arrow Forward Pressed');
            },
            onpressed1: () {
               Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  MyDocument()));
              
            },
          ),
          Profile_Tab(
            Profileoption: 'Timetable',
               onpressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ExamTimetableScreen()));
              // Callback function for IconButton pressed
              print('Arrow Forward Pressed');
            },
          ),
          // const Profile_Tab(
          //   Profileoption: 'Additional Info',
          // ),
          // const Profile_Tab(
          //   Profileoption: 'Scholarship Form',
          // ),
          // const Profile_Tab(
          //   Profileoption: 'Feedback',
          // ),
          // ContainerWithBorderOverlap()
          //   Acrylic(
          //   effect: AcrylicEffect.transparent,
          //   child: Center(
          //     child: Container(
          //       width: 300.0,
          //       height: 200.0,
          //       child: Center(
          //         child: Text(
          //           'Transparent Container',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 18.0,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
             Profile_Tab(
            Profileoption: 'Logout',
               onpressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.remove('username');
                            prefs.remove('password');
                             prefs.remove('dob');

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Login()));
              // Callback function for IconButton pressed
              print('Arrow Forward Pressed');
            },
          ),
        ],
      ),
    );
  }
}
