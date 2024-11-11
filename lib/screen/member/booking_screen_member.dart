import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingScreenMember extends StatefulWidget {
  const BookingScreenMember({super.key});

  @override
  State<BookingScreenMember> createState() => _BookingScreenMemberState();
}

class _BookingScreenMemberState extends State<BookingScreenMember> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedCoach;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  // List of example coaches
  final List<String> _coaches = [
    "Coach Leonard",
    "Coach Papopi",
    "Coach Jaqueno"
  ];

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Menambahkan scroll view
        padding:
            const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Need a Coach?
            const Text(
              'Need a Coach?',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF697684)),
            ),
            const SizedBox(height: 16),

            // Select Coach Dropdown
            const Text(
              'Select Coach',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF697684)),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedCoach,
              hint: const Text(
                "Coach", 
                style: TextStyle(
                    color: Colors
                        .white), 
              ),
              dropdownColor:
                  const Color(0xFF697684), 
              items: _coaches.map((String coach) {
                return DropdownMenuItem<String>(
                  value: coach,
                  child: Text(
                    coach,
                    style: const TextStyle(
                        color:
                            Colors.white), 
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCoach = newValue;
                });
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: const Color(
                    0xFF697684), // Mengatur background color pada field
              ),
              iconEnabledColor: Colors.white, // Mengatur warna ikon dropdown
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),

            // Select Date
            const Text(
              'Select Date',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF697684)),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF4B5563),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TableCalendar(
                focusedDay: _selectedDate,
                firstDay: DateTime(2020),
                lastDay: DateTime(2030),
                selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDate = selectedDay;
                  });
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

            // Select Time
            const Text(
              'Select Time',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF697684)),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              height: 70, // Menentukan tinggi row
              decoration: BoxDecoration(
                color: const Color(0xFF697684),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectTime(context, true),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            _startTime != null
                                ? "Start: ${_startTime!.format(context)}"
                                : "Select Start Time",
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  const Text(
                    ":",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectTime(context, false),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            _endTime != null
                                ? "End: ${_endTime!.format(context)}"
                                : "Select End Time",
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Book Now Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan fungsi booking di sini
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 123, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fixedSize: const Size(400, 55),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text(
                  'Book Now',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
