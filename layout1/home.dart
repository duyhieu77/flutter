import 'package:flutter/material.dart';
import 'detail.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello, Mark Adam"),
              const SizedBox(height: 8),
              const Text(
                "Enjoy Tasty Food in\nYour Town",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Search
              TextField(
                decoration: InputDecoration(
                  hintText: "Find Your Meal",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),
              const Text("Category"),
              const SizedBox(height: 8),

              Row(
                children: [
                  _chip("Popular", true),
                  _chip("Indian", false),
                  _chip("Chinese", false),
                ],
              ),

              const SizedBox(height: 16),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  children: [
                    foodCard(context, "Sandwich", "\$150", "assets/sandwich.png"),
                    foodCard(context, "Kebab", "\$250", "assets/kebab.png"),
                    foodCard(context, "Juice", "\$80", "assets/juice.png"),
                    foodCard(context, "Egg Items", "\$250", "assets/egg.png"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chip(String text, bool active) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: active ? Colors.black : Colors.white,
          border: Border.all(),
        ),
        child: Text(
          text,
          style: TextStyle(color: active ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget foodCard(BuildContext context, String name, String price, String img) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailPage(name, price, img)),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Image.asset(img, height: 80),
            const SizedBox(height: 8),
            Text(name),
            Text(price),
            const Spacer(),
            const Icon(Icons.add_circle_outline),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}