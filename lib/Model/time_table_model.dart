
//...............model for the timeTable Api .........................//
class timeTableModel {
  ExamTimetable? examTimetable;

  timeTableModel({this.examTimetable});

  timeTableModel.fromJson(Map<String, dynamic> json) {
    examTimetable = json['examTimetable'] != null
        ? new ExamTimetable.fromJson(json['examTimetable'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.examTimetable != null) {
      data['examTimetable'] = this.examTimetable!.toJson();
    }
    return data;
  }
}

class ExamTimetable {
  String? examTimetableUrl;

  ExamTimetable({this.examTimetableUrl});

  ExamTimetable.fromJson(Map<String, dynamic> json) {
    examTimetableUrl = json['examTimetableUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['examTimetableUrl'] = this.examTimetableUrl;
    return data;
  }
}
