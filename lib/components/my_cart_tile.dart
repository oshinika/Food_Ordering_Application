import 'package:flutter/material.dart';
import 'package:food/components/my_quantity_selector.dart';
import 'package:food/models/cart_item.dart';
import 'package:food/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        return Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 244, 120, 82), // Set background color to dark orange
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food image with increased size
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 120, // Increased height
                      width: 120, // Increased width
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Food name and price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Food name with bold styling
                        Text(
                          cartItem.food.name,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // Text color to contrast dark orange
                              ),
                        ),

                        // Food price with custom color
                        Text(
                          '\$${cartItem.food.price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.white, // Text color to contrast dark orange
                              ),
                        ),
                        const SizedBox(height: 10),

                        // Quantity selector
                        QuantitySelector(
                          quantity: cartItem.quantity,
                          food: cartItem.food,
                          onDecrement: () {
                            restaurant.removeFromCart(cartItem);
                          },
                          onIncrement: () {
                            restaurant.addToCart(
                              cartItem.food,
                              cartItem.selectedAddons,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Addons (if any)
              if (cartItem.selectedAddons.isNotEmpty) ...[
                const Divider(thickness: 1, color: Colors.white),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: cartItem.selectedAddons
                        .map(
                          (addon) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FilterChip(
                              label: Row(
                                children: [
                                  Text(addon.name),
                                  Text(' \$${addon.price.toString()}'),
                                ],
                              ),
                              shape: StadiumBorder(
                                side: BorderSide(
                                  color: Colors.white, // White border
                                ),
                              ),
                              backgroundColor: Colors.deepOrange.shade700,
                              labelStyle: TextStyle(
                                color: Colors.white, // White text
                              ),
                              onSelected: (_) {},
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
