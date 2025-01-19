import 'package:flutter/material.dart';
import 'package:food/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    // Initialize the text controller for the text field
    TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your location"),
        content: TextField(
          controller: textController, // Set the controller for the TextField
          decoration: const InputDecoration(hintText: "Enter Address"),
        ),
        actions: [
          // Cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),

          // Save button
          MaterialButton(
            onPressed: () {
              // Get the new address from the TextField
              String newAddress = textController.text;

              // Update the delivery address
              if (newAddress.isNotEmpty) {
                context.read<Restaurant>().updateDeliveryAddress(newAddress);
                Navigator.pop(context);
                textController.clear();
              } else {
                // Optionally, show an error if the text field is empty
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter a valid address')),
                );
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver now:",
            style: TextStyle(
              color: Color.fromARGB(255, 243, 240, 240), // Changed color to red
              fontSize: 18, // Optionally, adjust font size
              fontWeight: FontWeight.w600, // Optionally, adjust font weight
            ),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.deliveryAddress,
                    style: TextStyle(
                      color: Color.fromARGB(255, 224, 199, 192), // Changed color to green
                      fontWeight: FontWeight.bold,
                      fontSize: 16, // Optionally, adjust font size
                    ),
                  ),
                ),
                // Drop-down menu icon
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color.fromARGB(255, 223, 218, 215), // Changed color to blue
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
