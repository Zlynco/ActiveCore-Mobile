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
      bottomNavigationBar: Material(
        color: const Color(0xFF4B5563), // Warna latar belakang navbar
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[400],
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
      ),
    );
  }

  // Widget khusus untuk menambahkan garis di atas ikon yang aktif
  Widget _buildNavItem(IconData icon, int index) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        if (_currentIndex == index) // Garis hanya tampil pada ikon yang aktif
          Container(
            height: 4, // Tinggi garis
            width: 30, // Lebar garis
            color: Colors.white, // Warna garis saat aktif
            margin:
                const EdgeInsets.only(top: 30), // Posisi garis di atas ikon
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
