import 'package:flutter/material.dart';

class AttendanceListCard extends StatefulWidget {
  final String date;
  final List<bool> isPresent;
  
  AttendanceListCard({Key? key, required this.date, required this.isPresent})
      : super(key: key);

  @override
  State<AttendanceListCard> createState() => _AttendanceListCardState();
}

class _AttendanceListCardState extends State<AttendanceListCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.date),
            Wrap(
              spacing: 8.0, // Adjust the spacing between cards as needed
              runSpacing: 8.0,
              children: List.generate(
                widget.isPresent.length,
                (index) {
                  if (widget.isPresent.isEmpty) {
                    return Text('NO CLASSES');
                  }
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: widget.isPresent[index]
                        ? Color(0xff00CE46)
                        : Color(0xffF75757),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Text(
                        widget.isPresent[index] ? "P" : "A",
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
