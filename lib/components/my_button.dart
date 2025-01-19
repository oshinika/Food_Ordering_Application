import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double height; // Height property

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height = 50.0, required MaterialAccentColor buttonColor, required double borderRadius, required Color textColor, // Default height if not provided
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,  // Set the height of the button
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15), // Adjust horizontal padding to ensure text fits
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
