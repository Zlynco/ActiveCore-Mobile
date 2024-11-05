class Event {
  final String name;
  final String date;
  final String dayOfWeek;
  final String category;
  final DateTime startTime;
  final DateTime endTime;
  final int registeredCount;

  Event({
    required this.name,
    required this.date,
    required this.dayOfWeek,
    required this.category,
    required this.startTime,
    required this.endTime,
    required this.registeredCount,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      name: json['name'],
      date: json['date'],
      dayOfWeek: json['day_of_week'],
      category: json['category_id'],
      startTime: DateTime.parse(json['start_time']),
      endTime: DateTime.parse(json['end_time']),
      registeredCount: json['registered_count'],
    );
  }
}
