import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                // Text food details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '\$${food.price.toStringAsFixed(2)}', // Format price to 2 decimal places
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        food.description,
                        style: TextStyle(
                          color: Color.fromARGB(255, 109, 100, 100), // Set the description text color to black
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                // Food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    food.imagePath,
                    height: 120,
                    width: 120, // Add width to avoid image overflow
                    fit: BoxFit.cover, // Ensure the image scales correctly
                  ),
                ),
              ],
            ),
          ),
        ),
        // Divider line
        const Divider(
          color: Colors.grey, // Set a default color for the divider
          endIndent: 25,
          indent: 25,
        ),
      ],
    );
  }
}
