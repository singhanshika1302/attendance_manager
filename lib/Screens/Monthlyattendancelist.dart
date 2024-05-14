import 'package:edumarshals/Model/student_attendance_data_model.dart';
import 'package:edumarshals/Widget/AttendanceCard.dart';
import 'package:edumarshals/main.dart';
import 'package:edumarshals/repository/overall_attendance_repository.dart';
import 'package:flutter/material.dart';

class MonthlyAttendanceList extends StatefulWidget {
  final String? subject;
  final List<StudentAttendanceData>? attendanceData;

  MonthlyAttendanceList({required this.attendanceData,required this.subject});

  @override
  State<MonthlyAttendanceList> createState() => _MonthlyAttendanceListState();
}

class _MonthlyAttendanceListState extends State<MonthlyAttendanceList> {
  // ..............attendace api is intigrated ..................
  final AttendanceRepository _repository = AttendanceRepository();
  List<StudentAttendanceData>? _attendanceDataList;
  int _totalClasses = 0;
  int _totalPresentClasses = 0;
 

//.............calling attendance repository ...................................//
  Future<void> _fetchAttendanceData() async {
    List<StudentAttendanceData>? attendanceDataList =
        await _repository.fetchAttendance();
    int totalClasses = 0;
    int totalPresentClasses = 0;
//...............function to store total present and total classes .............//
    if (attendanceDataList != null) {
      for (var data in attendanceDataList) {
        totalClasses += data.totalClasses ?? 0;
        totalPresentClasses += data.totalPresent ?? 0;
      }
    }
    setState(() {
      _attendanceDataList = attendanceDataList;
      _totalClasses = totalClasses;
      print('totalclasses${_totalClasses}');
      // PreferencesManager.totalclasses=_totalClasses;
      // print('totalPresentClasses${_totalPresentClasses}');
      _totalPresentClasses = totalPresentClasses;

      PreferencesManager().totalclasses = _totalClasses;
      PreferencesManager().presentclasses = _totalPresentClasses;

      print('totalPresentClasses${_totalPresentClasses}');

      // print('dfghj $attendanceDataList');
      // PreferencesManager.totalclasses=_totalClasses;
    });
  }
    @override
  void initState() {
    super.initState();
    _fetchAttendanceData();
  }

  //................attendance api is intigrated ....................//
  @override
  Widget build(BuildContext context) {
    final sheight = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
                height: sheight * 0.18,
//.................fetching list in which all attendace is stored................//
                child: _attendanceDataList != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: _attendanceDataList!.length,
                              itemBuilder: (context, index) {
                                final attendanceData =
                                    _attendanceDataList![index];
//.......................assigning subject attendace to the SubjectAttendaceCard......//
                                if (attendanceData.subject == '${widget.subject}') {
                                  // Only render the SubjectAttendanceCard if the subject is Mathematics
                                  return AttendanceCard(
                                      attendedClasses:
                                          attendanceData.totalPresent!,
                                      totalClassess:
                                          attendanceData.totalClasses!,
                                      // title: widget.subjectName,
                                      title:
                                          'Subject: ${attendanceData.subject}',
                                      description: '');
                                  // SubjectAttendanceCard(
                                  //   subjectName:
                                  //       'Subject: ${attendanceData.subject}',
                                  //   attendedClasses:
                                  //       attendanceData.totalPresent!,
                                  //   totalClasses: attendanceData.totalClasses!,
                                  // );
                                } else {
                                  // Return an empty container for other subjects
                                  return Container();
                                }
                                // return SubjectAttendanceCard(
                                //   subjectName:
                                //       'Subject: ${attendanceData.subject}',
                                //   attendedClasses: attendanceData.totalPresent!,
                                //   totalClasses: attendanceData.totalClasses!,
                                // );
                              },
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: SizedBox(
                          height: 50, // Adjust the height as needed
                          width: 50, // Adjust the width as needed
                          child: CircularProgressIndicator(),
                        ),
                      ),
              ),
        // Add your additional containers here
        // Container(
        //  child: AttendanceCard(title: "", description: "", attendedClasses: 8, totalClassess: 9),
        // ),
        Expanded(
          // Wrap ListView.builder with Expanded to allow it to take all remaining space
          child: ListView.builder(
            itemCount: widget.attendanceData?.length,
            itemBuilder: (context, index) {
              final StudentAttendanceData monthData = widget.attendanceData![index];
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
