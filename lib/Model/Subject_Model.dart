class Subject {
  final String name;
  final String code;

  Subject({
    required this.name,
    required this.code,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      name: json['name'],
      code: json['code'],
    );
  }
}
