import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    // Text styles
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
    );
    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Delivery fee
          Column(
            children: [
              Text(
                "\$0.99",
                style: myPrimaryTextStyle.copyWith(color: Color.fromARGB(255, 252, 252, 252)), // Changed color
              ),
              Text(
                "Delivery fee",
                style: mySecondaryTextStyle.copyWith(color: Color.fromARGB(255, 213, 109, 109)), // Changed color
              ),
            ],
          ),
          // Delivery time
          Column(
            children: [
              Text(
                "15-30 min",
                style: TextStyle(color: Color.fromARGB(255, 252, 252, 252)), // Changed color
              ),
              Text(
                "Delivery time",
                style: TextStyle(color: Color.fromARGB(255, 213, 109, 109)), // Changed color
              ),
            ],
          ),
        ],
      ),
    );
  }
}
