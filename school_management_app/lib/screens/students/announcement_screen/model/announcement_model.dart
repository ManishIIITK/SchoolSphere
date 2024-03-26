// announcement_model.dart

class Announcement {
  final String announcerName;
  final DateTime dateTime;
  final String description;

  Announcement({
    required this.announcerName,
    required this.dateTime,
    required this.description,
  });

  String get date => "${dateTime.day}-${dateTime.month}-${dateTime.year}";

  String get time => "${dateTime.hour}:${dateTime.minute}";
}
