import 'package:active_core/screen/member/class/class_filter.dart';
import 'package:active_core/screen/member/class/list_class.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ClassScreenMember extends StatelessWidget {
  const ClassScreenMember({super.key});

  @override
  Widget build(BuildContext context) {
    final logger = Logger();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Looking for a class?',
              style: TextStyle(
                color: Color(0xFF697684),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ClassFilterMember(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Wrap(
                spacing: 12.0,
                runSpacing: 16.0,
                children: [
                  _buildCategoryCard(
                    context, 
                    'Karate', 
                    'assets/images/karate.jpg',
                    logger
                  ),
                  _buildCategoryCard(
                    context, 
                    'Muay Thai', 
                    'assets/images/muaythai.jpg',
                    logger
                  ),
                  _buildCategoryCard(
                    context, 
                    'Boxing', 
                    'assets/images/boxing.jpg',
                    logger
                  ),
                  _buildCategoryCard(
                    context, 
                    'Yoga', 
                    'assets/images/yoga.jpg',
                    logger
                  ),
                  _buildCategoryCard(
                    context, 
                    'Zumba', 
                    'assets/images/zumba.jpg',
                    logger
                  ),
                  // Tambahkan kategori lainnya sesuai kebutuhan
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildCategoryCard(BuildContext context, String category, String imagePath, Logger logger) {
    return GestureDetector(
      onTap: () {
        logger.d('$category Card tapped!');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListClassMember(category: category),
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
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath), // Menambahkan gambar kategori
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                category,
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
  }
}