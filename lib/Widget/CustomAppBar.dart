import 'package:flutter/material.dart';
import 'package:edumarshals/Screens/User_Info/Profile.dart';
import 'package:edumarshals/Widget/CommonDrawer.dart';
import 'package:edumarshals/main.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String userName;
  final String? userImage;
  final VoidCallback onTap;
  final GlobalKey<ScaffoldState> scaffoldKey_;

  const CustomAppBar({
    Key? key,
    required this.userName,
    this.userImage,
    required this.onTap,
    required this.scaffoldKey_,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _selectedTileIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          InkWell(
            child: const Icon(Icons.more_vert),
            onTap: () {
              widget.scaffoldKey_.currentState?.openDrawer();
            },
          ),
          InkWell(
            onDoubleTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            ),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 36, 34, 34),
              backgroundImage: widget.userImage != null
                  ? NetworkImage(PreferencesManager().studentPhoto)
                  : null,
              radius: 15.0,
            ),
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hello',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                widget.userName,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        // You can add additional actions here if needed
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            // Handle settings button press
          },
        ),
      ],
    );
  }
}