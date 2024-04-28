import 'package:edumarshals/Screens/User_Info/Profile.dart';
import 'package:edumarshals/Widget/CommonDrawer.dart';
import 'package:edumarshals/main.dart';
import 'package:flutter/material.dart';

import 'CommonDrawer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String? userImage;
    final VoidCallback onTap;


  const CustomAppBar({super.key, 
    required this.userName,
    this.userImage, required this.onTap,
  });

  get selectedTileIndex => -1;

  @override
  Widget build(BuildContext context) {
    int selectedTileIndex=0;
    return AppBar(
        surfaceTintColor: Colors.transparent
,

      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
    
      title: Row(
        children: [
          InkWell(child: const Icon(Icons.more_vert),onTap: () {

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CommonDrawer( selectedTileIndex: selectedTileIndex, onTap: () { 
                                            
onTap;
             },)));
          },),
          InkWell(
            onDoubleTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Profile())),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 36, 34, 34),
              backgroundImage:
                  userImage != null ? NetworkImage(PreferencesManager().studentPhoto) : null,
              radius: 15.0,
            ),
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                // utilis mein text.dart add karna hai
                'Hello',
                style: TextStyle(
                  fontSize: 14.0,
                  //same background ka 
                  color: Colors.grey,
                ),
              ),
              Text(
                userName,
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
