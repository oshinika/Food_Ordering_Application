import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;

  const MyDrawerTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0), // Adjust padding for balance
      child: Material(
        color: Colors.transparent, // Transparent to allow background color change
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.blueAccent, // Custom splash color on tap
          highlightColor: Colors.blue.withOpacity(0.1), // Light background color on highlight
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0), // Extra vertical padding
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), // Rounded corners for the tile
              color: Colors.transparent, // Default background color
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 28.0, // Larger icon size
                ),
                const SizedBox(width: 15.0), // Space between the icon and text
                Text(
                  text,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 18.0, // Slightly larger text
                    fontWeight: FontWeight.w500, // Medium font weight for a balanced look
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
