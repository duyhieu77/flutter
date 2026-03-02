import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String name, img, price;
  const DetailPage(this.name, this.img, this.price, {super.key});

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
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),

              Center(
                child: Image.asset(img, height: 220),
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: const TextStyle(fontSize: 22)),
                  Text("\$$price.00"),
                ],
              ),

              const Text("Location, City"),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  info(Icons.timer, "30 min"),
                  info(Icons.location_on, "12 km"),
                  info(Icons.star, "4.5"),
                ],
              ),

              const SizedBox(height: 16),
              const Text("Description", style: TextStyle(fontWeight: FontWeight.bold)),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                    "Nunc maximus, nulla ut commodo sagittis.",
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(14),
                  child: const Center(
                    child: Text("Checkout", style: TextStyle(color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget info(IconData icon, String text) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(text),
      ],
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