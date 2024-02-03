import 'package:edumarshal/Widget/Profile_Tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

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
        toolbarHeight: 150.0, // Adjust the height as needed
        title: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(8)),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/pdf 1.png'),
                backgroundColor: Color.fromARGB(255, 17, 37, 218),
              ),
              Text("Vidhi Gupta"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text(
                      "Roll no - 2200271540121",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Student no - 22154141",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.edit),
                        Text(
                          "Edit Profile",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.table_chart),
                        Text(
                          "Achievements",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.hdr_auto_select),
                        Text(
                          "Semester",
                          style: TextStyle(fontSize: 15),
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
