import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CourseScreen(),
    );
  }
}

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Color(0xff0f2027), Color(0xff203a43)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Flutter cơ bản',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Học Flutter từ cơ bản đến xây dựng ứng dụng hoàn chỉnh',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      const CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/300',
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Flutter cơ bản',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                const Text('Giảng viên: Nguyễn Văn A'),

                const SizedBox(height: 12),

                Row(
                  children: [
                    const Text(
                      '499.000đ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),
                    _infoChip('Giờ học', '20'),
                    const SizedBox(width: 8),
                    _infoChip('Bài', '20'),
                    const SizedBox(width: 8),
                    _infoChip('Thời lượng', '4:00'),
                  ],
                ),

                const SizedBox(height: 20),

                const Text(
                  'Lesson',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const LessonItem(title: 'Giới thiệu Flutter'),
                const LessonItem(title: 'Widget cơ bản'),
                const LessonItem(title: 'Layout'),
                const LessonItem(title: 'Navigation'),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Đăng ký học',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _infoChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text('$label: $value'),
    );
  }
}

class LessonItem extends StatelessWidget {
  final String title;

  const LessonItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(Icons.play_circle_outline),
          const SizedBox(width: 10),
          Text(title),
        ],
      ),
    );
  }
}
