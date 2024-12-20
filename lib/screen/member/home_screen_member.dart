import 'package:active_core/api/member_service.dart';
import 'package:active_core/screen/member/booking_screen_member.dart';
import 'package:active_core/screen/member/class/list_class.dart';
import 'package:active_core/screen/member/class_screen_member.dart';
import 'package:active_core/screen/member/profile_screen_member.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

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
    // Mendapatkan tanggal saat ini
    final now = DateTime.now();
    final dateFormatter = DateFormat('EEEE, d MMMM, y');
    final formattedDate = dateFormatter.format(now);
    final logger = Logger();
    final classService = ClassService();

    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul dan tanggal
            const Text(
              'Hello, member',
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

            // Kalender
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFF697684),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'NONE',
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
            const Text(
              'Your Booked Classes',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF697684),
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
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Colors.white),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Karate',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        Text(
                          'Coach Leonard',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Colors.white),
                        ),
                        Text('Wednesday, 16 October, 2024',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.white)),
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
            const SizedBox(height: 16),

            // Popular Class Categories Title
            const Text(
              'Popular Class Categories',
              style: TextStyle(
                color: Color(0xFF697684),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // FutureBuilder untuk Popular Class Categories
            FutureBuilder<List<dynamic>>(
              future: classService.fetchPopularCategory(
                  now.month), // Menggunakan bulan saat ini
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                  );
                } else if (snapshot.hasData) {
                  final categories = snapshot.data!;
                  return Wrap(
                    spacing: 12.0, // Jarak antar kartu horizontal
                    runSpacing: 16.0, // Jarak antar baris kartu
                    children: categories.map((category) {
                      final name =
                          category['name']; // Pastikan nama field benar
                      final imageUrl = _getCategoryImage(
                          name); // Menentukan gambar sesuai kategori

                      return GestureDetector(
                        onTap: () {
                          logger.d('$category Card tapped!');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ListClassMember(category: name),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 120,
                                width: 150,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: Image.asset(
                                    imageUrl,
                                    fit: BoxFit
                                        .cover, // Menyesuaikan gambar agar sesuai ukuran
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF697684),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return const Text('No popular categories found.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

String _getCategoryImage(String category) {
  switch (category.toLowerCase()) {
    case 'boxing':
      return 'assets/images/boxing.jpg';
    case 'karate':
      return 'assets/images/karate.jpg';
    case 'yoga':
      return 'assets/images/yoga.jpg';
    case 'zumba':
      return 'assets/images/zumba.jpg';
    case 'muay thai':
      return 'assets/images/muaythai.jpg';
    default:
      return ''; // Gambar default jika kategori tidak ditemukan
  }
}
