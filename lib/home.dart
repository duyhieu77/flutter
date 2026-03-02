import 'package:flutter/material.dart';
import 'detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Hello, Mark Adam"),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.black),
                  )
                ],
              ),

              const SizedBox(height: 10),
              const Text(
                "Enjoy Tasty Food in\nYour Town",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              // Search
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Find Your Meal",
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 14),
              const Text("Category"),

              const SizedBox(height: 6),
              Row(
                children: [
                  chip("Popular", true),
                  chip("Indian", false),
                  chip("Chinese", false),
                ],
              ),

              const SizedBox(height: 14),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.72,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    foodCard(context, "Sandwich", "assets/sandwich.png", "150", "4.5"),
                    foodCard(context, "Kebab", "assets/kebab.png", "250", "4.2"),
                    foodCard(context, "Juice", "assets/juice.png", "80", "4.0"),
                    foodCard(context, "Egg Items", "assets/egg.png", "250", "3.9"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget chip(String text, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: active ? Colors.black : Colors.white,
        border: Border.all(color: Colors.black),
      ),
      child: Text(
        text,
        style: TextStyle(color: active ? Colors.white : Colors.black),
      ),
    );
  }

  Widget foodCard(BuildContext context, String name, String img, String price, String rate) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DetailPage(name, img, price)),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("⭐ $rate", style: const TextStyle(fontSize: 12)),
            Expanded(
              child: Center(child: Image.asset(img)),
            ),
            Text(name),
            Text("\$$price.00"),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.add_circle_outline),
            )
          ],
        ),
      ),
    );
  }

  Widget bottomBar() {
    return Container(
      height: 60,
      color: Colors.black,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.favorite_border, color: Colors.white),
          Icon(Icons.shopping_cart, color: Colors.white),
          Icon(Icons.person_outline, color: Colors.white),
        ],
      ),
    );
  }
}