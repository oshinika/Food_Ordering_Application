import 'package:flutter/material.dart';
import 'package:food/models/restaurant.dart';
import 'package:provider/provider.dart'; // Ensure the provider package is added in pubspec.yaml

class MyReceipt extends StatefulWidget {
  const MyReceipt({super.key});

  @override
  _MyReceiptState createState() => _MyReceiptState();
}

class _MyReceiptState extends State<MyReceipt> with SingleTickerProviderStateMixin {
  // Animation Controller and Animation variable
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Duration of the animation
      vsync: this, // This refers to the TickerProvider
    );

    // Define the animation (Fade In)
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Start the animation when the widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align all content to the left
          mainAxisSize: MainAxisSize.min, // Ensures the Column adjusts to its content size
          children: [
            // Animated Text (Thank you for your order)
            FadeTransition(
              opacity: _animation, // Fade in effect using the animation
              child: const Text(
                "Thank you for your order!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange, // Brighter text color
                ),
              ),
            ),
            const SizedBox(height: 15), // Adds space between the elements
            Container(
              padding: const EdgeInsets.all(20), // Adds padding inside the container
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 235, 204), // Light background color for the receipt
                borderRadius: BorderRadius.circular(15), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // Soft shadow
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align all content to the left
                children: [
                  // Cart Receipt Content
                  Consumer<Restaurant>(
                    builder: (context, restaurant, child) {
                      return Text(
                        restaurant.displayCartReceipt(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20), // Adds space between content sections

                  // Estimated Delivery Time
                  const Text(
                    "Estimated delivery time is: 4:10 PM",
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
