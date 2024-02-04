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
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 0,
      child: Row(
        children: [
          // Image Name
          Container(
            child: Center(child: Image.asset("asset/images/pdf1.png")),
          ),

          // Document Name

          Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              documentname,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.035,
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
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ))),
        ],
      ),
    );
  }
}
