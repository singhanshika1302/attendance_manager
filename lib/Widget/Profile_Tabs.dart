import 'package:flutter/material.dart';

class Profile_Tab extends StatelessWidget {
  final String Profileoption;
  final VoidCallback? onpressed;

  const Profile_Tab({super.key, required this.Profileoption, this.onpressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Profileoption,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
          IconButton(onPressed: onpressed, icon: const Icon(Icons.arrow_forward))
        ],
      ),
    );
  }
}
