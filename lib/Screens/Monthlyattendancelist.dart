import 'package:edumarshals/Model/student_attendance_data_model.dart';
import 'package:flutter/material.dart';

class MonthlyAttendanceList extends StatelessWidget {
  final List<StudentAttendanceData>? attendanceData;

  MonthlyAttendanceList({required this.attendanceData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Add your additional containers here
        Container(
          
          // Your container properties
          // Add any widgets or content you want
        ),
        Expanded(
          // Wrap ListView.builder with Expanded to allow it to take all remaining space
          child: ListView.builder(
            itemCount: attendanceData?.length,
            itemBuilder: (context, index) {
              final StudentAttendanceData monthData = attendanceData![index];
              final String subject = monthData.subject ?? '';
              final List<Attendance> attendance = monthData.attendance ?? [];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      subject,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildAttendanceCards(attendance),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAttendanceCards(List<Attendance> attendance) {
    Map<String, List<Attendance>> groupedAttendance = {};

    // Group attendance by date
    attendance.forEach((data) {
      String date = data.date ?? '';
      if (!groupedAttendance.containsKey(date)) {
        groupedAttendance[date] = [];
      }
      groupedAttendance[date]!.add(data);
    });

    return Column(
      children: groupedAttendance.entries.map((entry) {
        String date = entry.key;
        List<Attendance> attendance = entry.value;

        return AttendanceListCard1(
          date: date,
          attendance: attendance,
        );
      }).toList(),
    );
  }
}

class AttendanceListCard1 extends StatelessWidget {
  final String date;
  final List<Attendance> attendance;

  AttendanceListCard1({
    required this.date,
    required this.attendance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 255, 255, 255),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(date,style: TextStyle(fontWeight: FontWeight.w500),),
            Wrap(
              spacing: 8.0, // Adjust the spacing between cards as needed
              runSpacing: 8.0,
              children: attendance.map((data) {
                final bool attended = data.attended ?? false;
                final bool isAc = data.isAc ?? false;

                return _buildAttendanceWidget(attended,);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

 Widget _buildAttendanceWidget(bool attended) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: attended ? Color(0xff00CE46) : Color(0xffF75757), // Present/Absent Color
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          attended ? "P" : "A",
        ),
      ),
    );
  }
}
