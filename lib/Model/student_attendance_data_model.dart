
//..........Model Structure for the Student Attendance Api......................//
class StudentAttendanceData {
  int? totalClasses;
  int? totalPresent;
  List<Attendance>? attendance;
  String? subject;

  StudentAttendanceData(
      {this.totalClasses, this.totalPresent, this.attendance, this.subject});

  StudentAttendanceData.fromJson(Map<String, dynamic> json) {
    totalClasses = json['totalClasses'];
    totalPresent = json['totalPresent'];
    if (json['attendance'] != null) {
      attendance = <Attendance>[];
      json['attendance'].forEach((v) {
        attendance!.add(new Attendance.fromJson(v));
      });
    }
    subject = json['subject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalClasses'] = this.totalClasses;
    data['totalPresent'] = this.totalPresent;
    if (this.attendance != null) {
      data['attendance'] = this.attendance!.map((v) => v.toJson()).toList();
    }
    data['subject'] = this.subject;
    return data;
  }
}

class Attendance {
  String? date;
  bool? attended;
  bool? isAc;

  Attendance({this.date, this.attended, this.isAc});

  Attendance.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    attended = json['attended'];
    isAc = json['isAc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['attended'] = this.attended;
    data['isAc'] = this.isAc;
    return data;
  }
}
