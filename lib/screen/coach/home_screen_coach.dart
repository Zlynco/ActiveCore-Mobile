import 'package:active_core/api/coach_service.dart';
import 'package:active_core/models/getclass.dart';
import 'package:active_core/screen/coach/booking_screen_coach.dart';
import 'package:active_core/screen/coach/class_screen_coach.dart';
import 'package:active_core/screen/coach/detail_class_coach.dart';
import 'package:active_core/screen/coach/profile_screen_coach.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreenCoach extends StatefulWidget {
  const HomeScreenCoach({super.key});

  @override
  HomeScreenCoachState createState() => HomeScreenCoachState();
}

class HomeScreenCoachState extends State<HomeScreenCoach> {
  int _currentIndex = 0;

  // Daftar halaman yang akan ditampilkan di setiap tab
  final List<Widget> _pages = [
    const HomeScreenCoachContent(), // Halaman Home
    const ClassScreenCoach(), // Halaman Kelas
    const BookingScreenCoach(), // Halaman Booking
    const ProfileScreenCoach(), // Halaman Profil
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Menampilkan halaman berdasarkan index
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:
            const Color(0xFF4B5563), // Menambahkan warna latar belakang
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Memperbarui index saat ditekan
          });
        },
        selectedItemColor: Colors.white, // Warna item terpilih
        unselectedItemColor: Colors.grey[400], // Warna item tidak terpilih
        items: [
          BottomNavigationBarItem(
            icon: _buildNavItem(Icons.home, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildNavItem(Icons.flash_on, 1),
            label: 'Class',
          ),
          BottomNavigationBarItem(
            icon: _buildNavItem(Icons.calendar_today, 2),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: _buildNavItem(Icons.person, 3),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Widget khusus untuk menambahkan garis di atas ikon yang aktif
  Widget _buildNavItem(IconData icon, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_currentIndex == index)
          Container(
            height: 4,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(bottom: 10, top: 0),
          ),
        Icon(icon),
      ],
    );
  }
}

// Buat halaman konten untuk HomeScreenMember
class HomeScreenCoachContent extends StatefulWidget {
  const HomeScreenCoachContent({super.key});

  @override
  HomeScreenCoachContentState createState() => HomeScreenCoachContentState();
}

class HomeScreenCoachContentState extends State<HomeScreenCoachContent> {
  final Logger logger = Logger();
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Map<DateTime, List<Event>> _events = {};

  // Fetch events when the widget is initialized
  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  // Function to fetch events from the API
  Future<void> _fetchEvents() async {
    final classService = CoachService();
    List? events = await classService.getClasses();
    logger.d("Events from API: $events");

    if (events != null) {
      Map<DateTime, List<Event>> eventsMap = {};

      for (var eventJson in events) {
        logger.d("Event data: $eventJson");

        Event event = Event.fromJson(eventJson);

        DateTime eventDate = event.date;

        if (!eventsMap.containsKey(eventDate)) {
          eventsMap[eventDate] = [];
        }
        eventsMap[eventDate]?.add(event);
      }

      setState(() {
        _events = eventsMap; // Update the state with the events map
      });
    }
  }

  List<Event> _getEventsForDay(DateTime day) {
    final normalizedDay =
        DateTime(day.year, day.month, day.day); // Normalisasi hari
    return _events[normalizedDay] ??
        []; // Mengembalikan list event berdasarkan hari
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dateFormatter = DateFormat('EEEE, d MMMM, y');
    final formattedDate = dateFormatter.format(now);

    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello, Coach',
              style: TextStyle(
                color: Color(0xFF697684),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              formattedDate,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF697684),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF4B5563),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8.0),
              child: TableCalendar(
                firstDay: DateTime.utc(2022, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  final normalizedSelectedDay = DateTime(
                      selectedDay.year, selectedDay.month, selectedDay.day);

                  logger.d('Selected day: $normalizedSelectedDay');
                  setState(() {
                    _selectedDay = normalizedSelectedDay;
                    _focusedDay = focusedDay;
                  });
                  List<Event> eventsForSelectedDay =
                      _events[normalizedSelectedDay] ?? [];
                  final eventNames =
                      eventsForSelectedDay.map((event) => event.name).toList();
                  logger.d('Events on selected day: $eventNames');
                },
                eventLoader: (day) {
                  // Memuat acara untuk hari yang dipilih
                  return _getEventsForDay(day)
                      .map((e) => e.name)
                      .toList(); // Mengambil nama acara
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: const BoxDecoration(
                    color: Colors.orangeAccent,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                  markerDecoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle: const TextStyle(color: Colors.white),
                  weekendTextStyle: TextStyle(color: Colors.red[200]),
                  outsideTextStyle: const TextStyle(color: Colors.grey),
                  holidayTextStyle: const TextStyle(color: Colors.redAccent),
                  outsideDaysVisible: true,
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: const TextStyle(color: Colors.white),
                  weekendStyle: TextStyle(color: Colors.grey[300]),
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
                  leftChevronIcon:
                      Icon(Icons.chevron_left, color: Colors.white),
                  rightChevronIcon:
                      Icon(Icons.chevron_right, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Reminder',
              style: TextStyle(
                color: Color(0xFF697684),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Don\'t Forget Your Schedule',
              style: TextStyle(
                color: Color(0xFF697684),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            // Menampilkan acara untuk hari yang dipilih
            ..._getEventsForDay(_selectedDay).map((event) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailClassCoach(
                              className: event
                                  .name), // Pass event name or other details
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF697684),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Classes',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${event.name} at ${TimeOfDay.fromDateTime(event.startTime).format(context)} - ${TimeOfDay.fromDateTime(event.endTime).format(context)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
