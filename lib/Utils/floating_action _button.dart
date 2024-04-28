import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class custom_floating_action_button extends StatefulWidget {
  final GlobalKey<ExpandableFabState> Gkey;
  custom_floating_action_button({super.key, required this.Gkey});

  @override
  State<custom_floating_action_button> createState() =>
      _custom_floating_action_buttonState();
}
//**********when importing this widget, initialize the key below in your page to create separate instance for each page
// final _key = GlobalKey<ExpandableFabState>();

class _custom_floating_action_buttonState
    extends State<custom_floating_action_button> {
  bool _isFabOpen = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // BackdropFilter with QuarterCircleClipper for blur effect
        if (_isFabOpen)
          Positioned(
            bottom: -200,
            right: -200,
            child: ClipPath(
              clipper: QuarterCircleClipper(),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  width: 400,
                  height: 400,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ExpandableFab(
          key: widget.Gkey,
          onOpen: () {
            setState(() {
              _isFabOpen = true;
            });
          },
          onClose: () {
            setState(() {
              _isFabOpen = false;
            });
          },
          openButtonBuilder: RotateFloatingActionButtonBuilder(
            child: Icon(Icons.grid_view_rounded),
            foregroundColor: Colors.white,
            backgroundColor: Color(0xff004BB8),
            shape: CircleBorder(),
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
                  ),
                ),
              );
            },
          ),
          children: [
            // Your expandable FAB buttons
            FloatingActionButton.small(
              backgroundColor: Colors.white,
              shape: CircleBorder(),
              child: Icon(
                Icons.home_filled,
                color: Color(0xff004BB8),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'homepage');
              },
            ),
            FloatingActionButton.small(
              backgroundColor: Colors.white,
              shape: CircleBorder(),
              child: Icon(
                Icons.bar_chart,
                color: Color(0xff004BB8),
              ),
              onPressed: () {
                // Navigate to bar chart page
                Navigator.pushNamed(
                    context, 'subject_wise_attendance');
              },
            ),
            FloatingActionButton.small(
              backgroundColor: Colors.white,
              shape: CircleBorder(),
              child: Icon(
                Icons.library_books_rounded,
                color: Color(0xff004BB8),
              ),
              onPressed: () {
                // Navigate to assignment page
                Navigator.pushNamed(context, 'test_screen');
              },
            ),
            FloatingActionButton.small(
              backgroundColor: Colors.white,
              shape: CircleBorder(),
              child: Icon(
                Icons.person,
                color: Color(0xff004BB8),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'profile');
              },
            ),
          ],
        ),
      ],
    );
  }
}

class QuarterCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
