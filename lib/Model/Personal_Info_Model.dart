// To parse this JSON data, do
//
//     final personalInfo = personalInfoFromJson(jsonString);

import 'dart:convert';

PersonalInfo personalInfoFromJson(String str) => PersonalInfo.fromJson(json.decode(str));

String personalInfoToJson(PersonalInfo data) => json.encode(data.toJson());

class PersonalInfo {
    PersonalInfoClass personalInfo;

    PersonalInfo({
        required this.personalInfo,
    });

    factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
        personalInfo: PersonalInfoClass.fromJson(json["personalInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "personalInfo": personalInfo.toJson(),
    };
}

class PersonalInfoClass {
    String name;
    String gender;
    DateTime dob;
    String courseName;
    DateTime admissionDate;
    String branch;
    int semester;
    String admissionMode;
    String section;
    String category;
    String domicileState;
    String jeeRank;
    String jeeRollNo;
    String lateralEntry;
    String hostel;

    PersonalInfoClass({
        required this.name,
        required this.gender,
        required this.dob,
        required this.courseName,
        required this.admissionDate,
        required this.branch,
        required this.semester,
        required this.admissionMode,
        required this.section,
        required this.category,
        required this.domicileState,
        required this.jeeRank,
        required this.jeeRollNo,
        required this.lateralEntry,
        required this.hostel,
    });

    factory PersonalInfoClass.fromJson(Map<String, dynamic> json) => PersonalInfoClass(
        name: json["name"],
        gender: json["gender"],
        dob: DateTime.parse(json["dob"]),
        courseName: json["courseName"],
        admissionDate: DateTime.parse(json["admissionDate"]),
        branch: json["branch"],
        semester: json["semester"],
        admissionMode: json["admissionMode"],
        section: json["section"],
        category: json["category"],
        domicileState: json["domicileState"],
        jeeRank: json["jeeRank"],
        jeeRollNo: json["jeeRollNo"],
        lateralEntry: json["lateralEntry"],
        hostel: json["hostel"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "courseName": courseName,
        "admissionDate": "${admissionDate.year.toString().padLeft(4, '0')}-${admissionDate.month.toString().padLeft(2, '0')}-${admissionDate.day.toString().padLeft(2, '0')}",
        "branch": branch,
        "semester": semester,
        "admissionMode": admissionMode,
        "section": section,
        "category": category,
        "domicileState": domicileState,
        "jeeRank": jeeRank,
        "jeeRollNo": jeeRollNo,
        "lateralEntry": lateralEntry,
        "hostel": hostel,
    };
}
