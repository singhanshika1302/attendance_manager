import 'package:flutter/material.dart';

class attendance_list_card extends StatefulWidget {
  final String date;
  final bool isPresent;
  attendance_list_card(
      {super.key, required this.date, required this.isPresent});

  @override
  State<attendance_list_card> createState() => _attendance_list_cardState();
}

class _attendance_list_cardState extends State<attendance_list_card> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.date),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: widget.isPresent?Color(0xff00CE46):Color(0xffF75757),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                child: Text(
                  widget.isPresent ? "P" : "A",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
