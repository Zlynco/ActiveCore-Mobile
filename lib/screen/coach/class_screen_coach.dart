import 'package:active_core/api/coach_service.dart';
import 'package:active_core/models/coachclasses.dart';
import 'package:active_core/screen/coach/detail_class_coach.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ClassScreenCoach extends StatefulWidget {
  const ClassScreenCoach({super.key});

  @override
  ClassScreenCoachState createState() => ClassScreenCoachState();
}

class ClassScreenCoachState extends State<ClassScreenCoach> {
  late Future<List<ClassModel>> futureClasses;
  final Logger logger = Logger();

  @override
  void initState() {
    super.initState();
    futureClasses = fetchClasses(); // Ambil data kelas saat layar pertama kali dibuka
  }

  // Fungsi untuk mengambil data kelas
  Future<List<ClassModel>> fetchClasses() async {
    final classService = CoachService();
    try {
      final classes = await classService.getClasses();

      if (classes != null) {
        logger.i('Data kelas berhasil diambil.');
        return classes
            .map((classData) => ClassModel.fromJson(classData))
            .toList();
      } else {
        logger.w('Tidak ada kelas yang tersedia.');
        throw Exception('Tidak ada data kelas');
      }
    } catch (e) {
      logger.e('Terjadi kesalahan saat mengambil kelas: $e');
      throw Exception('Gagal mengambil kelas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Classes Schedule',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xFF697684),
              ),
            ),
            const SizedBox(height: 2), // Spacing under the title
            Expanded(
              child: FutureBuilder<List<ClassModel>>(
                future: futureClasses,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No classes available.'));
                  } else {
                    final classList = snapshot.data!;
                    return ListView.builder(
                      itemCount: classList.length,
                      itemBuilder: (context, index) {
                        final content = classList[index]; // Get the class data
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailClassCoach(
                                    className: content.name,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Classes',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          content.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'at ${content.startTime.hour}:${content.startTime.minute} - ${content.endTime.hour}:${content.endTime.minute}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Room: ${content.room}',
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
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
