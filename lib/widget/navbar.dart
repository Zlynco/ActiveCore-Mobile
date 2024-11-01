import 'package:flutter/material.dart';
import 'package:active_core/screen/member/booking_screen_member.dart';
import 'package:active_core/screen/member/class_screen_member.dart';
import 'package:active_core/screen/member/home_screen_member.dart';
import 'package:active_core/screen/member/profile_screen_member.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF4B5563),
      currentIndex: currentIndex,
      onTap: (index) {
        // Navigasi ke halaman yang sesuai saat item ditekan tanpa animasi
        if (currentIndex != index) {
          Navigator.of(context).pushReplacement(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              switch (index) {
                case 0:
                  return const HomeScreenMember();
                case 1:
                  return const ClassScreenMember();
                case 2:
                  return const BookingScreenMember();
                case 3:
                  return const ProfileScreenMember();
                default:
                  return const HomeScreenMember();
              }
            },
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return child; // Tidak ada animasi
            },
          ));
        }
      },
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[400],
      items: [
        BottomNavigationBarItem(
          icon: _buildNavItem(Icons.home, 0, currentIndex),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _buildNavItem(Icons.flash_on, 1, currentIndex),
          label: 'Class',
        ),
        BottomNavigationBarItem(
          icon: _buildNavItem(Icons.calendar_month, 2, currentIndex),
          label: 'Booking',
        ),
        BottomNavigationBarItem(
          icon: _buildNavItem(Icons.person, 3, currentIndex),
          label: 'Profile',
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, int index, int currentIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (currentIndex == index)
          Container(
            height: 4,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(bottom: 0),
          ),
        Icon(icon),
      ],
    );
  }
}
