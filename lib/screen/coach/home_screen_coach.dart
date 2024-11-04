import 'package:active_core/screen/coach/booking_screen_member.dart';
import 'package:active_core/screen/coach/class_screen_member.dart';
import 'package:active_core/screen/coach/profile_screen_member.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      appBar: AppBar(
        title: const Text('ActiveCore'),
        centerTitle: true,
      ),
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
class HomeScreenCoachContent extends StatelessWidget {
  const HomeScreenCoachContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan tanggal saat ini
    final now = DateTime.now();
    final dateFormatter = DateFormat('EEEE, d MMMM, y');
    final formattedDate = dateFormatter.format(now);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Judul
          const Text(
            'Hello, Coach',
            style: TextStyle(
              color: Color(0xFF697684),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          // Menampilkan tanggal
          Text(
            formattedDate,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF697684),
            ),
          ),
          const SizedBox(height: 16),
          // Kalender
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xFF697684),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'Calendar',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Reminder
          const Text(
            'Reminder',
            style: TextStyle(
              color: Color(0xFF697684),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          // Button persegi panjang
          Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.only(top: 8.0),
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Classes',
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12,color: Colors.white),
                      ),
                      SizedBox(height: 4),
                      Text('Karate', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),),
                      Text('Coach Leonard', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.white),),
                      Text('Wednesday, 16 October, 2024', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.white)),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}