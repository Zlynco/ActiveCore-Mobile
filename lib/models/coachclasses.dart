class Event {
  final String name;
  final String description;
  final String dayOfWeek;
  final String category;
  final String room;
  final DateTime startTime;
  final DateTime endTime;
  final int registeredCount;
  final DateTime date;
  final int price;

  Event({
    required this.name,
    required this.description,
    required this.dayOfWeek,
    required this.category,
    required this.room,
    required this.startTime,
    required this.endTime,
    required this.registeredCount,
    required this.date,
    required this.price,
  });

  // Factory method to create Event from JSON map
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      name: json['name'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      dayOfWeek: json['day_of_week'],
      category: json['category_id'],
      room: json['room'],
      startTime: DateTime.parse(json['start_time']),
      endTime: DateTime.parse(json['end_time']),
      price: json['price'],
      registeredCount: json['registered_count'],
    );
  }
}

class ClassModel {
  final String name;
  final String description;
  final String dayOfWeek;
  final String category;
  final String room;
  final DateTime startTime;
  final DateTime endTime;
  final int registeredCount;
  final DateTime date;
  final int price;

  ClassModel({
    required this.name,
    required this.description,
    required this.dayOfWeek,
    required this.category,
    required this.room,
    required this.startTime,
    required this.endTime,
    required this.registeredCount,
    required this.date,
    required this.price,
  });

  // Factory method to create Event from JSON map
  factory ClassModel.fromJson(Map<String, dynamic> json) {
      return ClassModel(
      name: json['name'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      dayOfWeek: json['day_of_week'],
      category: json['category_id'],
      room: json['room'],
      startTime: DateTime.parse(json['start_time']),
      endTime: DateTime.parse(json['end_time']),
      price: int.tryParse(json['price'].toString()) ?? 0, // Menangani jika value adalah String
      registeredCount: int.tryParse(json['registered_count'].toString()) ?? 0, // Menangani jika value adalah String
    );
  }
}
