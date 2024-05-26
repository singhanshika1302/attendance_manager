// attendance_model.dart

class SubjectWiseAttendanceModel {
  int? totalClasses;
  int? totalPresent;
  List<SWAttendance>? attendance;
  String? subject;

  SubjectWiseAttendanceModel(
      {this.totalClasses, this.totalPresent, this.attendance, this.subject});

  factory SubjectWiseAttendanceModel.fromJson(Map<String, dynamic> json) {
    return SubjectWiseAttendanceModel(
      totalClasses: json['totalClasses'],
      totalPresent: json['totalPresent'],
      attendance: json['attendance'] != null
          ? (json['attendance'] as List)
              .map((i) => SWAttendance.fromJson(i))
              .toList()
          : null,
      subject: json['subject'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalClasses'] = totalClasses;
    data['totalPresent'] = totalPresent;
    if (attendance != null) {
      data['attendance'] = attendance!.map((v) => v.toJson()).toList();
    }
    data['subject'] = subject;
    return data;
  }

  @override
  String toString() {
    return 'Subject: $subject, Total Classes: $totalClasses, Total Present: $totalPresent, Attendance: $attendance';
  }
}

class SWAttendance {
  String? date;
  bool? attended;
  bool? isAc;

  SWAttendance({this.date, this.attended, this.isAc});

  factory SWAttendance.fromJson(Map<String, dynamic> json) {
    return SWAttendance(
      date: json['date'],
      attended: json['attended'],
      isAc: json['isAc'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['attended'] = attended;
    data['isAc'] = isAc;
    return data;
  }

  @override
  String toString() {
    return 'Date: $date, Attended: $attended, Is Academic: $isAc';
  }
}