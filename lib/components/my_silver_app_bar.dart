import 'package:flutter/material.dart';
import 'package:food/pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 240, 238, 238), // Set color for nav icon and action icons
      ),
      actions: [
        // Cart button
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ),
            );
          },
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
      backgroundColor:  Color.fromARGB(255, 183, 89, 7), // Set dark orange color for the app bar
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text(
        "Meal Magic",
        style: TextStyle(
          color: Color.fromARGB(255, 240, 238, 238), // Change font color here
          fontSize: 24, // Optionally adjust the font size
          fontWeight: FontWeight.bold, // Optionally adjust the font weight
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0), // Adjust the padding here
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
