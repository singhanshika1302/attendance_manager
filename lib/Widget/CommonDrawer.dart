import 'package:flutter/material.dart';
import '../Screens/Events/Events_Page.dart';
import '../Screens/HomePage/Homepage.dart';

class CommonDrawer extends StatefulWidget {
  const CommonDrawer({super.key});
  @override
  _CommonDrawerState createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  int selectedTileIndex = -1;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double drawerWidth = MediaQuery.of(context).size.width * 0.5;
    return SizedBox(
      width: drawerWidth,
      child: Drawer(
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
              buildDrawerTile(
                  0, 'assets/bank.png', 'Classroom', 'assets/sel_bank.png', 4,
                  context),
              buildDrawerTile(
                  1, 'assets/buliding.png', 'Hostel', 'assets/sel_building.png',
                  4, context),
              buildDrawerTile(
                  2, 'assets/teacher.png', 'Placement', 'assets/sel_teacher.png',
                  4, context),
              buildDrawerTile(
                  3, 'assets/note.png', 'PYQS Papers', 'assets/sel_note.png', 3.7,
                  context),
              buildDrawerTile(
                  4, 'assets/fees.png', 'Fees', 'assets/sel_fees.png', 3.7,
                  context),
              buildDrawerTile(
                  5, 'assets/events.png', 'Events', 'assets/sel_events.png', 4,
                  context),
            ],
          ),
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
          setState(() {
            selectedTileIndex = index;
          });
          _scaffoldKey.currentState?.openDrawer();
          Navigator.pop(context);
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
              break;
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => EventsPage()));
              break;
          }
        },
      ),
    );
  }
}

