import 'package:edumarshals/Screens/Events/Events_Page.dart';
import 'package:edumarshals/Screens/HomePage/Homepage.dart';
import 'package:edumarshals/Screens/drawer_screens/fees.dart';
import 'package:edumarshals/Screens/drawer_screens/hostel_leaves.dart';
import 'package:flutter/material.dart';
import '../Screens/Events/Events_Page.dart';
import '../Screens/HomePage/Homepage.dart';

class CommonDrawer extends StatelessWidget {
  // final Function(int) onDrawerItemSelected;
  final VoidCallback onTap;
  
  final int selectedTileIndex;

  const CommonDrawer({
    // required this.onDrawerItemSelected,
    required this.selectedTileIndex, 
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
      // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // int selectedTileIndex = -1;
    return Drawer(
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
                onTap;
                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
    
                Navigator.pop(context);
              },
            ),
            buildDrawerTile(0, 'assets/bank.png', 'Classroom', 'assets/sel_bank.png', 4, context),
            buildDrawerTile(1, 'assets/buliding.png', 'Hostel', 'assets/sel_building.png', 4, context),
            buildDrawerTile(2, 'assets/teacher.png', 'Placement', 'assets/sel_teacher.png', 4, context),
            buildDrawerTile(3, 'assets/note.png', 'PYQS Papers', 'assets/sel_note.png', 3.7, context),
            buildDrawerTile(4, 'assets/fees.png', 'Fees', 'assets/sel_fees.png', 3.7, context),
            buildDrawerTile(5, 'assets/events.png', 'Events', 'assets/sel_events.png', 4, context),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerTile(int index, String defaultImage, String title,
      String selectedImage, double scale, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: index == selectedTileIndex ? Colors.white : null,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListTile(
        leading: Image.asset(
          index == selectedTileIndex ? selectedImage : defaultImage,
          scale: scale,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: index == selectedTileIndex ? const Color.fromRGBO(
                0, 75, 184, 0.92) : const Color.fromRGBO(235, 243, 255, 0.92),
            fontSize: 20,
          ),
        ),
        onTap: () {
          // setState(() {
          //   // selectedTileIndex = index;
          // });
          // _scaffoldKey.currentState?.openDrawer();
          Navigator.pop(context);
          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => hostelLeavePage()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => EventsPage()));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (context) => EventsPage()));
              break;
            case 4:
              Navigator.push(context, MaterialPageRoute(builder: (context) => feesPage()));
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

