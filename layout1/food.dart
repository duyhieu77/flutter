import 'package:flutter/material.dart';
import 'food.dart';

class DetailPage extends StatelessWidget {
  final Food food;

  const DetailPage(this.food, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(food.image, height: 200),
            const SizedBox(height: 16),
            Text(food.name, style: const TextStyle(fontSize: 22)),
            Text("\$${food.price}", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}