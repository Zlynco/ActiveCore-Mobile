import 'package:active_core/api/member_service.dart';
import 'package:active_core/screen/member/class/booking_class_detail.dart';
import 'package:flutter/material.dart';
import 'package:active_core/models/classes.dart';
import 'package:intl/intl.dart';

class ListClassMember extends StatelessWidget {
  final String category;

  const ListClassMember({super.key, required this.category});

  // Menggunakan service untuk mendapatkan daftar kelas
 Future<List<Classes>> _fetchClasses(String category) async {
    final classService = ClassService();
    // Fetch the full list of classes
    List<Classes> allClasses = await classService.fetchClasses();

    // Mengambil tanggal hari ini dan satu bulan ke depan
    DateTime today = DateTime.now();
    DateTime oneMonthLater = today.add(const Duration(days: 30));

    // Filter kelas yang tanggalnya antara hari ini dan satu bulan ke depan
    List<Classes> filteredClasses = allClasses.where((classItem) {
      return classItem.date.isAfter(today) && classItem.date.isBefore(oneMonthLater);
    }).toList();

    // Jika ada kategori yang dipilih, filter lagi berdasarkan kategori
    if (category.isNotEmpty) {
      return filteredClasses
          .where((classItem) => classItem.category == category)
          .toList();
    } else {
      return filteredClasses; // Return kelas yang sudah difilter
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.isNotEmpty ? 'All $category Class' : 'All Classes',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Image.asset(
                      'assets/icons/filter.png',
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () {
                      // Tambahkan fungsi filter di sini
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: FutureBuilder<List<Classes>>(
                future: _fetchClasses(category), // Pass category to fetch filtered classes
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No classes available.'));
                  } else {
                    final classes = snapshot.data!;
                    return ListView.builder(
                      itemCount: classes.length,
                      itemBuilder: (context, index) {
                        final classItem = classes[index];
                        return Container(
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
                          child: GestureDetector(
                            onTap: () {
                              // Mengirim data kelas dan kategori ke halaman detail
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ClassBookingScreenDetail(
                                    classItem: classItem,
                                    category: category, // Kirim kategori
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        classItem.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Coached By ${classItem.coach}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        DateFormat('d MMMM yyyy').format(classItem.date), // Format ke "14 November 2024"
                                        style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'At ${classItem.startTime.hour}:${classItem.startTime.minute} - ${classItem.endTime.hour}:${classItem.endTime.minute}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
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
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
