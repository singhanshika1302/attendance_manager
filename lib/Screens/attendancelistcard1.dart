// import 'package:flutter/material.dart';

// class AttendanceListCard1 extends StatefulWidget {
//   final String date;
//   final bool isPresent;
//   final bool isAc;

//   AttendanceListCard1({
//     required this.date,
//     required this.isPresent,
//     required this.isAc,
//   });

//   @override
//   State<AttendanceListCard1> createState() => _AttendanceListCard1State();
// }

// class _AttendanceListCard1State extends State<AttendanceListCard1> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Color.fromARGB(255, 182, 232, 255),
//       elevation: 0,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(widget.date),
//             Wrap(
//               spacing: 8.0, // Adjust the spacing between cards as needed
//               runSpacing: 8.0,
//               children: [
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   color: widget.isAc
//                       ? Color(0xffF75757) // Non-Academic Color
//                       : widget.isPresent
//                           ? Color(0xff00CE46) // Present Color
//                           : Color(0xffF75757), // Absent Color
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                     child: Text(
//                       widget.isAc
//                           ? "Non-Academic"
//                           : widget.isPresent
//                               ? "P"
//                               : "A",
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
