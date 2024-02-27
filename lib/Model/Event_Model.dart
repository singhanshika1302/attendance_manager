class EventModel {
  final String id;
  final String hostingOrganization;
  final String eventName;
  final String date;
  final String event;
  final String registrationUrl;
  final String detail;

  EventModel({
    required this.id,
    required this.hostingOrganization,
    required this.eventName,
    required this.date,
    required this.event,
    required this.registrationUrl,
    required this.detail,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['_id'],
      hostingOrganization: json['hostingOrganization'],
      eventName: json['eventName'],
      date: json['date'],
      event: json['event'],
      registrationUrl: json['registrationUrl'],
      detail: json['detail'],
    );
  }
}
