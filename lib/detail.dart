import 'package:flutter/material.dart';
import 'food.dart';

class DetailPage extends StatelessWidget {

  final Food food;

  DetailPage(this.food);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(food.name),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Center(
              child: Image.asset(
                food.image,
                height: 200,
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  food.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "\$${food.price}",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),

              ],
            ),

            SizedBox(height: 20),

            Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              food.description,
              style: TextStyle(fontSize: 16),
            ),

            Spacer(),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {},

                child: Text("Checkout"),
              ),
            )

          ],
        ),
      ),
    );
  }
}