// import 'package:edumarshal/Widget/Profile_Tabs.dart';
import 'package:edumarshals/Screens/My_Documents_Screen.dart';
import 'package:edumarshals/Widget/Profile_Tabs.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: const Color.fromRGBO(235, 243, 255, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 160.0, // Adjust the height as needed
        title: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(8)),
              CircleAvatar(
                backgroundImage: AssetImage('assets/assets/Ellipse 7.jpg'),
                backgroundColor: Color.fromARGB(255, 17, 37, 218),
              ),
              Text("Vidhi Gupta"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text(
                      "Roll no - 2200271540121",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width * 0.03),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Student no - 22154141",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width * 0.03),
                    ),
                  ),
                ],
              ),
              Divider(),
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
                            margin: EdgeInsets.all(7),
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
                            margin: EdgeInsets.all(7),
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
                            margin: EdgeInsets.all(7),
                            child: Image.asset(
                                "assets/assets/Frame 48117 (2).png")),

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
          ),
          Profile_Tab(
            Profileoption: 'Guardian Information',
          ),
          Profile_Tab(
            Profileoption: 'Contact Details',
          ),
          Profile_Tab(
            Profileoption: 'Education Details',
          ),
          Profile_Tab(
            Profileoption: 'My Documents',
            onpressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyDocument()));
              // Callback function for IconButton pressed
              print('Arrow Forward Pressed');
            },
          ),
          Profile_Tab(
            Profileoption: 'Student Researches',
          ),
          Profile_Tab(
            Profileoption: 'Additional Info',
          ),
          Profile_Tab(
            Profileoption: 'Scholarship Form',
          ),
          Profile_Tab(
            Profileoption: 'Feedback',
          ),

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
        ],
      ),
    );
  }
}
