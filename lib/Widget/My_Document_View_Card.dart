import 'package:flutter/material.dart';

class My_Document_View_Card extends StatelessWidget {
  final String documentname;
  final String textbuttonname;
  final VoidCallback? onpressed;

  My_Document_View_Card({
    required this.documentname,
    this.onpressed,
    required this.textbuttonname,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 0,
      child: Row(
        children: [
          // Image Name
          Container(
            child: Center(
              child: Icon(
                Icons.image,
              ),
            ),
          ),

          // Document Name

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              documentname,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          Spacer(),

          // View Name

          Container(
              margin: EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: onpressed,
                  child: Text(
                    textbuttonname,
                    style: TextStyle(color: Colors.blue),
                  ))),
        ],
      ),
    );
  }
}
