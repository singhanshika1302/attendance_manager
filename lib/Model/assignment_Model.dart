class assignment_Model {
  List<Assignment>? assignment;

  assignment_Model({this.assignment});

  assignment_Model.fromJson(Map<String, dynamic> json) {
    if (json['assignment'] != null) {
      assignment = <Assignment>[];
      json['assignment'].forEach((v) {
        assignment!.add(new Assignment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.assignment != null) {
      data['assignment'] = this.assignment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Assignment {
  String? assignmentId;
  Subject? subject;
  String? assignment;
  Teacher? teacher;
  String? deadline;
  String? description;

  Assignment(
      {this.assignmentId,
      this.subject,
      this.assignment,
      this.teacher,
      this.deadline,
      this.description});

  Assignment.fromJson(Map<String, dynamic> json) {
    assignmentId = json['_id'];
    subject =
        json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
    assignment = json['assignment'];
    teacher =
        json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
    deadline = json['deadline'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assignmentId'] = this.assignmentId;
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    data['assignment'] = this.assignment;
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    data['deadline'] = this.deadline;
    data['description'] = this.description;
    return data;
  }
}

class Subject {
  String? name;
  String? code;

  Subject({this.name, this.code});

  Subject.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}

class Teacher {
  String? name;

  Teacher({this.name});

  Teacher.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
