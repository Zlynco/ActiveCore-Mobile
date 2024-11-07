import 'package:flutter/material.dart';

class ProfileScreenCoach extends StatelessWidget {
  const ProfileScreenCoach({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xFF697684),
              ),
            ),
            const SizedBox(height: 16), // Spasi di bawah judul
            GestureDetector(
              onTap: () {
                // Tambahkan fungsi untuk tap pada profile
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF4B5563),
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
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/icons/avatar-man.png', // Ganti dengan path foto profil yang sesuai
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16), // Spasi antara foto dan teks
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Coach Name', // Ganti dengan nama sebenarnya
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'email@example.com', // Ganti dengan email sebenarnya
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.edit, // Ikon pensil
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24), 
            ElevatedButton(
              onPressed: () {
                // Navigasi atau aksi untuk Booking History
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF697684), 
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.history,
                        color: Colors.white,
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Booking History',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined, // Ikon panah
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            
            ElevatedButton(
              onPressed: () {
                // Navigasi atau aksi untuk Booking History
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF697684), 
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined, // Ikon panah
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16), // Spasi antara tombol
            ElevatedButton(
              onPressed: () {
                // Navigasi atau aksi untuk Booking History
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF697684), 
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Logout Account',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined, // Ikon panah
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
