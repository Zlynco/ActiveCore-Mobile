import 'package:active_core/screen/member/booking_screen_member.dart';
import 'package:active_core/screen/member/class_screen_member.dart';
import 'package:active_core/screen/member/profile_screen_member.dart';
import 'package:flutter/material.dart';

class HomeScreenMember extends StatefulWidget {
  const HomeScreenMember({super.key});

  @override
  HomeScreenMemberState createState() => HomeScreenMemberState();
}

class HomeScreenMemberState extends State<HomeScreenMember> {
  int _currentIndex = 0;

  // Daftar halaman yang akan ditampilkan di setiap tab
  final List<Widget> _pages = [
    const HomeScreenMemberContent(), // Halaman Home
    const ClassScreenMember(), // Halaman Kelas
    const BookingScreenMember(), // Halaman Booking
    const ProfileScreenMember(), // Halaman Profil
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
class HomeScreenMemberContent extends StatelessWidget {
  const HomeScreenMemberContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Welcome to the Member Home Page!'),
    );
  }
}
