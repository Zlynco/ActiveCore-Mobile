import 'package:intl/intl.dart';

class Classes {
  final int id;
  final String name;
  final String description;
  final String dayOfWeek;
  final String category;
  final String room;
  final DateTime startTime;
  final DateTime endTime;
  final String coach;
  final int quota;
  final DateTime date;
  final double price;
  final int registeredCount;

  Classes({
    required this.id,
    required this.name,
    required this.description,
    required this.dayOfWeek,
    required this.category,
    required this.room,
    required this.startTime,
    required this.endTime,
    required this.coach,
    required this.quota,
    required this.date,
    required this.price,
    required this.registeredCount,
  });

  factory Classes.fromJson(Map<String, dynamic> json) {
    // DateFormat for the date in yyyy-MM-dd
    final DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    // DateFormat for the time in HH:mm:ss
    final DateFormat timeFormat = DateFormat("HH:mm:ss");

    // Clean up the strings if needed (removing 'at' from 'date' or 'start_time')
    String cleanedDate = json['date']?.replaceAll(' at', '') ?? '';
    String cleanedStartTime = json['start_time']?.replaceAll(' at', '') ?? '';
    String cleanedEndTime = json['end_time']?.replaceAll(' at', '') ?? '';

    return Classes(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      dayOfWeek: json['day_of_week'],
      // Parse the cleaned date string with dateFormat
      date: dateFormat.parse(cleanedDate), 
      // Parse the cleaned start and end time strings with timeFormat
      startTime: timeFormat.parse(cleanedStartTime),
      endTime: timeFormat.parse(cleanedEndTime),
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      category: json['category'],
      room: json['room'],
      coach: json['coach'],
      quota: json['quota'],
      registeredCount: json['registered_count'],
    );
  }
}
