import 'package:active_core/models/classes.dart';
import 'package:active_core/screen/member/class/class_booked_details.dart';
import 'package:flutter/material.dart';
import 'package:active_core/api/member_service.dart';
import 'package:intl/intl.dart';

class ClassBookingScreenDetail extends StatefulWidget {
  final String category;
  final Classes classItem;

  const ClassBookingScreenDetail(
      {super.key, required this.category, required this.classItem});

  @override
  State<ClassBookingScreenDetail> createState() =>
      _ClassBookingScreenDetailState();
}

class _ClassBookingScreenDetailState extends State<ClassBookingScreenDetail> {
  final ClassService _classService = ClassService();
  Future<Map<String, dynamic>>? _bookingFuture;
  late int availableQuota;

   @override
  void initState() {
    super.initState();
    availableQuota = widget.classItem.quota;
  }
  void _bookClass() {
    setState(() {
      _bookingFuture = _classService.bookClass(widget.classItem.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEEE, d MMMM yyyy').format(widget.classItem.date);
    final imageUrl = _getCategoryImage(widget.category);


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
                '${widget.classItem.category} Class',
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
              Text(widget.classItem.description,
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
                    widget.classItem.coach,
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
                    DateFormat('HH:mm').format(widget.classItem.startTime),
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
                    DateFormat('HH:mm').format(widget.classItem.endTime),
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
                    widget.classItem.room,
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
                    'Rp${widget.classItem.price}',
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
        child: FutureBuilder<Map<String, dynamic>>(
          future: _bookingFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  fixedSize: const Size(400, 55),
                ),
                child: const CircularProgressIndicator(color: Colors.white),
              );
            } else if (snapshot.hasData) {
              final result = snapshot.data!;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (result['success']) {
                  // Tampilkan dialog sukses
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Success'),
                      content: Text(result['message']),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ClassBookedScreenDetail(
                                  classItem: widget.classItem,
                                ),
                              ),
                            );
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Tampilkan dialog error
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: Text(result['message']),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              });
            }

            return ElevatedButton(
              onPressed: availableQuota > 0 ? _bookClass : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: availableQuota > 0
                    ? const Color.fromARGB(255, 0, 123, 255)
                    : const Color(0xFF697684),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                fixedSize: const Size(400, 55),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: Text(
                availableQuota > 0 ? 'Book Now' : 'Class Full',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          },
        ),
      ),
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
        return 'assets/images/default_class.jpg';
    }
  }
}
