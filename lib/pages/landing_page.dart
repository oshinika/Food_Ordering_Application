import 'package:flutter/material.dart';
import 'package:food/pages/login_page.dart'; // Import the LoginPage

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(232, 199, 59, 24), // Background color for the page
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // This centers content vertically
          children: [
            // Image that fits the screen width and height with aspect ratio preserved
            Expanded(
              child: Image.asset(
                'lib/images/sides/food_background12.jpg', // Replace with your image asset path
                fit: BoxFit.cover,  // This ensures the image covers the entire container
                width: double.infinity,  // Ensure the image stretches to the full width
              ),
            ),
            const SizedBox(height: 20),
            // Title with new font style
            const Text(
              "Good Food, Good Health",
              style: TextStyle(
                fontSize: 30, // Increased font size
                fontWeight: FontWeight.w600, // Slightly lighter bold style
                fontStyle: FontStyle.italic, // Added italic style
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            // Subtitle
            const Text(
              "Delivery solution in phone",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // Reduced the space between subtitle and button
            // Get Started button
            ElevatedButton(
              onPressed: () {
                // Navigate to the LoginPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(227, 245, 132, 84),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20), // Optional: Adjust the space at the bottom if needed
          ],
        ),
      ),
    );
  }
}
