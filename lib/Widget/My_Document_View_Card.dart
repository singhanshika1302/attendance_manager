import 'package:flutter/material.dart';

class My_Document_View_Card extends StatelessWidget {
  final String documentname;
  final String textbuttonname;
  final VoidCallback? onpressed;

  const My_Document_View_Card({super.key, 
    required this.documentname,
    this.onpressed,
    required this.textbuttonname,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 0,
      child: Row(
        children: [
          // Image Name
          Padding(padding: EdgeInsets.all(4)),
          Container(
            child: Center(child: Image.asset("asset/images/pdf1.png")),
          ),

          // Document Name

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              documentname,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.035,
              ),
            ),
          ),
          const Spacer(),

          // View Name

          Container(
              margin: const EdgeInsets.all(8.0),
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
