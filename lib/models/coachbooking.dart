class CoachBooking {
  final String title;
  final DateTime start;
  final DateTime end;
  final ExtendedProps extendedProps;

  CoachBooking({
    required this.title,
    required this.start,
    required this.end,
    required this.extendedProps,
  });

  // Fungsi untuk membuat objek CoachBooking dari JSON
  factory CoachBooking.fromJson(Map<String, dynamic> json) {
    return CoachBooking(
      title: json['title'],
      start: DateTime.parse(json['start']),
      end: DateTime.parse(json['end']),
      extendedProps: ExtendedProps.fromJson(json['extendedProps']),
    );
  }

  // Fungsi untuk mengonversi objek CoachBooking ke JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'start': start.toIso8601String(),
      'end': end.toIso8601String(),
      'extendedProps': extendedProps.toJson(),
    };
  }
}

// Model untuk extendedProps yang berisi informasi lebih lanjut
class ExtendedProps {
  final String coach;
  final String member;
  final int sessionCount;

  ExtendedProps({
    required this.coach,
    required this.member,
    required this.sessionCount,
  });

  // Fungsi untuk membuat objek ExtendedProps dari JSON
  factory ExtendedProps.fromJson(Map<String, dynamic> json) {
    return ExtendedProps(
      coach: json['coach'],
      member: json['member'],
      sessionCount: json['session_count'],
    );
  }

  // Fungsi untuk mengonversi objek ExtendedProps ke JSON
  Map<String, dynamic> toJson() {
    return {
      'coach': coach,
      'member': member,
      'session_count': sessionCount,
    };
  }
}
