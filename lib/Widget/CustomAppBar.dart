import 'package:edumarshals/Screens/User_Info/Profile.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String? userImage;

  const CustomAppBar({super.key, 
    required this.userName,
    this.userImage,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          const Icon(Icons.more_vert),
          InkWell(
            onDoubleTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Profile())),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 36, 34, 34),
              backgroundImage:
                  userImage != null ? AssetImage(userImage!) : null,
              radius: 20.0,
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
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
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
          icon: const Icon(Icons.notification_add),
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
