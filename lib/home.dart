import 'package:flutter/material.dart';
import 'detail.dart';
import 'data.dart';
import 'food.dart';

class HomePage extends StatelessWidget {

  Widget foodCard(BuildContext context, Food food) {
    return GestureDetector(

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(food),
          ),
        );
      },

      child: Card(
        child: Column(
          children: [

            SizedBox(height: 10),

            Image.asset(
              food.image,
              height: 80,
            ),

            SizedBox(height: 10),

            Text(
              food.name,
              style: TextStyle(fontSize: 16),
            ),

            Text(
              "\$${food.price}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Spacer(),

            Icon(Icons.add_circle_outline),

            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Food App"),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: GridView.builder(

          itemCount: foods.length,

          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),

          itemBuilder: (context, index) {

            Food food = foods[index];

            return foodCard(context, food);
          },
        ),
      ),
    );
  }
}