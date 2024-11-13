import 'package:active_core/features/authentication/role.dart';
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
                            'Member Name', // Ganti dengan nama sebenarnya
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
            // Tombol Booking History
            buildProfileButton(
              icon: Icons.history,
              label: 'Booking History',
              onPressed: () {
                // Tambahkan navigasi atau fungsi untuk Booking History
              },
            ),
            const SizedBox(height: 42), // Spasi antara tombol
            // Tombol Delete
            buildProfileButton(
              icon: Icons.delete,
              label: 'Delete',
              onPressed: () {
                // Tambahkan aksi untuk Delete
              },
            ),
            const SizedBox(height: 16), // Spasi antara tombol
            // Tombol Logout Account
            buildProfileButton(
              icon: Icons.exit_to_app,
              label: 'Logout Account',
              onPressed: () {
                 Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const SelectRole()),
              (Route<dynamic> route) => false,
            );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun tombol profil
  Widget buildProfileButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF697684),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined, // Ikon panah
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
