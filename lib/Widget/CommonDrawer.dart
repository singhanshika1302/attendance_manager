import 'package:edumarshals/Screens/Events/Events_Page.dart';
import 'package:edumarshals/Screens/drawer_screens/fees.dart';
import 'package:edumarshals/Screens/drawer_screens/hostel_leaves.dart';
import 'package:flutter/material.dart';
import 'package:edumarshals/Screens/HomePage/Homepage.dart';

class CommonDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey_;
  final int currentIndex; // Add currentIndex property

  const CommonDrawer({
    Key? key,
    required this.scaffoldKey_,
    required this.currentIndex, // Add currentIndex parameter
  }) : super(key: key);

  @override
  _CommonDrawerState createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  int selectedTileIndex = -1;

  @override
  void initState() {
    super.initState();
    // Initialize selectedTileIndex based on currentIndex
    selectedTileIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    double drawerWidth = MediaQuery.of(context).size.width * 0.7;
    return Drawer(
      key: widget.scaffoldKey_,
      backgroundColor: Color(0xff004BB8),
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
                setState(() {
                  selectedTileIndex = -1; // Reset the selectedTileIndex
                });
                Navigator.of(context).pop(); // Close the drawer
              },

            ),
            buildDrawerTile(0, 'assets/bank.png', 'Classroom', 'assets/sel_bank.png', 4),
            buildDrawerTile(1, 'assets/buliding.png', 'Hostel', 'assets/sel_building.png', 4),
            buildDrawerTile(2, 'assets/teacher.png', 'Placement', 'assets/sel_teacher.png', 4),
            buildDrawerTile(3, 'assets/note.png', 'PYQS Papers', 'assets/sel_note.png', 3.7),
            buildDrawerTile(4, 'assets/fees.png', 'Fees', 'assets/sel_fees.png', 3.7),
            buildDrawerTile(5, 'assets/events.png', 'Events', 'assets/sel_events.png', 4),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerTile(int index, String defaultImage, String title, String selectedImage, double scale) {
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
            color: index == selectedTileIndex ? const Color.fromRGBO(0, 75, 184, 0.92) : const Color.fromRGBO(235, 243, 255, 0.92),
            fontSize: 20,
          ),
        ),
        onTap: () {
          setState(() {
            selectedTileIndex = index;
          });
          widget.scaffoldKey_.currentState?.openDrawer();
          Navigator.pop(context);
          // Navigate based on the selected tile index
          switch (index) {
            case 0:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
              break;
            case 1:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => hostelLeavePage()));
              break;
            case 2:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EventsPage()));
              break;
            case 3:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EventsPage()));
              break;
            case 4:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => feesPage()));
              break;
            case 5:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EventsPage()));
              break;
          }
        },
      ),
    );
  }
}