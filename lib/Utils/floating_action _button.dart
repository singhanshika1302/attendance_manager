import 'package:edumarshals/Screens/HomePage/Homepage.dart';
import 'package:edumarshals/Screens/Notes_Assignment/ClassNotesPage.dart';
import 'package:edumarshals/Screens/Notes_Assignment/Subject_Assignment.dart';
import 'package:edumarshals/Screens/User_Info/Profile.dart';
import 'package:edumarshals/main.dart';
import 'package:edumarshals/Screens/Attendance/subject_wise_attendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class custom_floating_action_button extends StatefulWidget {
  const custom_floating_action_button({super.key});

  @override
  State<custom_floating_action_button> createState() => _custom_floating_action_buttonState();
}
 final _key = GlobalKey<ExpandableFabState>();

class _custom_floating_action_buttonState extends State<custom_floating_action_button> {
  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
        key: _key,
        //       duration: const Duration(milliseconds: 500),
        //      distance: 200.0,
        //      type: ExpandableFabType.up,
        //    pos: ExpandableFabPos.left,
        //      childrenOffset: const Offset(0, 20),
        //    fanAngle: 40,
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: Icon(Icons.grid_view_rounded),
          //fabSize: ExpandableFabSize.large,
          foregroundColor: Colors.white,
          backgroundColor: Color(0xff004BB8),
          shape: CircleBorder(),
          //         angle: 3.14 * 2,
        ),
        closeButtonBuilder: FloatingActionButtonBuilder(
          size: 56,
          builder: (BuildContext context, void Function()? onPressed,
              Animation<double> progress) {
            return CircleAvatar(
              backgroundColor: Color(0xff004BB8),
              radius: 30,
              child: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.grid_view_rounded,
                  color: Colors.white,

                  //size: 40,
                ),
              ),
            );
          },
        ),
        overlayStyle: ExpandableFabOverlayStyle(
          //color: Colors.black.withOpacity(0.5),
          blur: 2,
        ),
        onOpen: () {
          debugPrint('onOpen');
        },
        afterOpen: () {
          debugPrint('afterOpen');
        },
        onClose: () {
          debugPrint('onClose');
        },
        afterClose: () {
          debugPrint('afterClose');
        },
        children: [
          FloatingActionButton.small(
            backgroundColor: Colors.white,
            shape: CircleBorder(),
            heroTag: null,
            child: Icon(
              Icons.home_filled,
              color: Color(0xff004BB8),
            ),

            onPressed: () {
              Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => const Homepage())));
            },
            //const SnackBar snackBar = SnackBar(
            // content: Text("SnackBar"),
            // );
            // scaffoldKey.currentState?.showSnackBar(snackBar);
          ),
          FloatingActionButton.small(
            backgroundColor: Colors.white,
            shape: CircleBorder(),
            heroTag: null,
            child: Icon(
              Icons.bar_chart,
              color: Color(0xff004BB8),
            ),
            onPressed: () {
                          Navigator.of(context).push(
                             MaterialPageRoute(builder: ((context) =>  barGraph(userName: PreferencesManager().name, userImage: PreferencesManager().studentPhoto, subjectName: "Maths", subjectDescription: "m"))));
            },
          ),
          FloatingActionButton.small(
            backgroundColor: Colors.white,
            shape: CircleBorder(),
            heroTag: null,
            child: Icon(Icons.library_books_rounded, color: Color(0xff004BB8)),
            onPressed: () {
               Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => Subject_Assignment())));
            },
          ),
          FloatingActionButton.small(
            backgroundColor: Colors.white,
            shape: CircleBorder(),
            heroTag: null,
            child: Icon(Icons.person, color: Color(0xff004BB8)),
            onPressed: () {
               Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => const Profile())));
            },
          ),
        ],
      );
  }
}