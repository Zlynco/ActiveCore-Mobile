import 'package:active_core/models/classes.dart';
import 'package:active_core/screen/member/class/class_booked_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClassBookingScreenDetail extends StatelessWidget {
  final String category;
  final Classes classItem;

  const ClassBookingScreenDetail(
      {super.key, required this.category, required this.classItem});

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEEE, d MMMM yyyy').format(classItem.date);
    final imageUrl = _getCategoryImage(category);
    int availableQuota = classItem.quota;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new_rounded,
                            color: Color(0xFF697684)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                '${classItem.category} Class',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF697684)),
              ),
              const SizedBox(height: 8),
              Text(formattedDate,
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF697684))),
              const SizedBox(height: 8),
              const Text('Deskripsi:',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF697684))),
              const SizedBox(height: 4),
              Text(classItem.description,
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF697684))),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text(
                    'Coach: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF697684)),
                  ),
                  Text(
                    classItem.coach,
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xFF697684)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text(
                    'Start Time: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF697684)),
                  ),
                  Text(
                    DateFormat('HH:mm').format(classItem.startTime),
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xFF697684)),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // End Time
              Row(
                children: [
                  const Text(
                    'End Time: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF697684)),
                  ),
                  Text(
                    DateFormat('HH:mm').format(classItem.endTime),
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xFF697684)),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Room
              Row(
                children: [
                  const Text(
                    'Room: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF697684)),
                  ),
                  Text(
                    classItem.room,
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xFF697684)),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Price
              Row(
                children: [
                  const Text(
                    'Price: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF697684)),
                  ),
                  Text(
                    'Rp${classItem.price}',
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xFF697684)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('Kuota Available: ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF697684))),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: availableQuota > 0 ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      availableQuota > 0 ? '$availableQuota' : 'Full',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: availableQuota > 0
                ? () {
                    // Navigasi ke halaman ClassBookedScreenDetail
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassBookedScreenDetail(
                          classItem:
                              classItem, // Kirim classItem ke halaman berikutnya
                        ),
                      ),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: availableQuota > 0
                  ? const Color.fromARGB(255, 0, 123, 255)
                  : const Color(0xFF697684),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              fixedSize: const Size(400, 55),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            ),
            child: Text(
              availableQuota > 0 ? 'Book Now' : 'Class Full',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          )),
    );
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
        return 'assets/images/default_class.jpg'; // Gambar default jika kategori tidak ditemukan
    }
  }
}
