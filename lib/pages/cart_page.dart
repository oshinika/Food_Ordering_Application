import 'package:flutter/material.dart';
import 'package:food/components/my_button.dart';
import 'package:food/components/my_cart_tile.dart';
import 'package:food/pages/payment_page.dart';
import 'package:provider/provider.dart';
import 'package:food/models/restaurant.dart';



class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart; // Cart is guaranteed to be initialized

        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              // Clear cart button
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Clear Cart"),
                      content: const Text("Are you sure you want to clear the cart?"),
                      actions: [
                        // Cancel button
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        // Yes button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: Column(
            children: [
              // List of cart items
              Expanded(
                child: userCart.isEmpty
                    ? Center(
                        child: const Text("Cart is Empty..."),
                      )
                    : ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          // Get individual cart item
                          final cartItem = userCart[index];

                          // Return cart tile UI
                          return MyCartTile(cartItem: cartItem);
                        },
                      ),
              ),

              // Button to proceed to checkout
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MyButton(
                 onTap: () => Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const PaymentPage()),
                 ),
                 text: "Go to Checkout",
                  buttonColor: Colors.orangeAccent,  // Custom background color
                  textColor: Colors.white,           // Custom text color
                  borderRadius: 12.0,                // Custom border radius
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
