import 'package:flutter/material.dart';
import '../models/food_item.dart';

class FoodDetailScreen extends StatelessWidget {
  final FoodItem item; // The data being passed from MenuScreen

  const FoodDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      // wrap content in SingleChildScrollView to prevent overflow on smaller screens
      body: SingleChildScrollView(
        child: Column(
          children: [
            item.type == 'network'
                ? Image.network(
                    item.img,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    item.img,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item.price,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Enjoy a fresh meal at the campus canteen. Fast, easy, and Q-Less.",
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Add to Cart"),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
