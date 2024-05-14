class classnotes_model {
  List<ClassNotes>? classNotes;

  classnotes_model({this.classNotes});

  classnotes_model.fromJson(Map<String, dynamic> json) {
    if (json['classNotes'] != null) {
      classNotes = <ClassNotes>[];
      json['classNotes'].forEach((v) {
        classNotes!.add(new ClassNotes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.classNotes != null) {
      data['classNotes'] = this.classNotes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClassNotes {
  Subject? subject;
  String? classNotesUrl; // Update variable name
  Teacher? teacher;

  ClassNotes({this.subject, this.classNotesUrl, this.teacher});

  ClassNotes.fromJson(Map<String, dynamic> json) {
    // Print the entire JSON response for debugging
    print('ClassNotes.fromJson: JSON=$json');

    subject = json['subject'] != null ? Subject.fromJson(json['subject']) : null;
    classNotesUrl = json['classNotes'];
    teacher = json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null;

    print('ClassNotes.fromJson: classNotesUrl=$classNotesUrl');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (subject != null) {
      data['subject'] = subject!.toJson();
    }
    data['classNotes'] = classNotesUrl; // Update key name
    if (teacher != null) {
      data['teacher'] = teacher!.toJson();
    }
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