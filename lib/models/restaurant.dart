import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food/models/cart_item.dart';
import 'package:food/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier{

// list of food menu
final List<Food> _menu = [

 
  //burgers
  Food(
    name: "Classic Cheeseburger", 
    description: "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.", 
    imagePath: "lib/images/burgers/cheese_burger.jpg",
    price: 0.99, 
    category: FoodCategory.burgers, 
    availableAddons: [
      Addon(name: "Extra cheese", price: 0.99),
      Addon(name: "Bacon", price: 1.99),
      Addon(name: "Avacado", price: 2.99)
    ],
  ),

  Food(
    name: "BBQ Burger",
    description: "A smoky barbecue-flavored burger with a juicy beef patty, onions, and crispy lettuce.",
    imagePath: "lib/images/burgers/bbq_burger.jpg",
    price: 1.49,
    category: FoodCategory.burgers,
    availableAddons: [
      Addon(name: "Extra BBQ Sauce", price: 0.49),
      Addon(name: "Bacon", price: 1.99),
      Addon(name: "Jalapeños", price: 0.99),
    ],
  ),

   Food(
    name: "Aloha Burger",
    description: "A tropical burger with a juicy beef patty, grilled pineapple, smoky barbecue sauce, and fresh lettuce in a toasted bun.",
    imagePath: "lib/images/burgers/aloha-burgers-4.jpg",
    price: 2.49,
    category: FoodCategory.burgers,
    availableAddons: [
      Addon(name: "Extra BBQ Sauce", price: 0.49),
      Addon(name: "Grilled Pineapple", price: 0.79),
      Addon(name: "Bacon", price: 1.99),
    ],
  ),

  Food(
    name: "Vegan Burger",
    description: "A delicious plant-based burger with a hearty vegetable patty, crisp lettuce, ripe tomatoes, and zesty mayo on a soft bun.",
    imagePath: "lib/images/burgers/vegi_burger.jpg",
    price: 2.49,
    category: FoodCategory.burgers,
    availableAddons: [
      Addon(name: "Extra Veggies", price: 0.49),
      Addon(name: "Cheese Slice", price: 0.99),
      Addon(name: "Jalapeans", price: 0.99),
    ],
  ),

  Food(
    name: "Beef Burger",
    description: "A classic all-beef patty with lettuce, tomato, onion, and a soft sesame bun.",
    imagePath: "lib/images/burgers/beef_burger.jpg",
    price: 1.29,
    category: FoodCategory.burgers,
    availableAddons: [
      Addon(name: "Cheese", price: 0.99),
      Addon(name: "Bacon", price: 1.99),
      Addon(name: "Extra Patty", price: 2.49),
    ],
  ),


  //desserts

  Food(
    name: "Gourmet Dessert",
    description: "An elegant layered dessert with rich chocolate mousse and a creamy vanilla base.",
    imagePath: "lib/images/desserts/gourmet_dessrt.jfif",
    price: 2.99,
    category: FoodCategory.desserts,
    availableAddons: [
      Addon(name: "Extra chocolate topping", price: 0.99),
      Addon(name: "Whipped cream", price: 0.49),
    ],
  ),

  Food(
    name: "Oreo Dessert",
    description: "A creamy dessert layered with Oreo crumbles and chocolate sauce.",
    imagePath: "lib/images/desserts/oreo.jfif",
    price: 2.49,
    category: FoodCategory.desserts,
    availableAddons: [
      Addon(name: "Extra Oreo crumbles", price: 0.49),
      Addon(name: "Caramel drizzle", price: 0.49),
    ],
  ),
  Food(
    name: "Strawberry Panna Cotta",
    description: "A light and creamy Italian dessert topped with fresh strawberry sauce.",
    imagePath: "lib/images/desserts/strawberry_panna_cotta.jpg",
    price: 3.49,
    category: FoodCategory.desserts,
    availableAddons: [
      Addon(name: "Extra strawberries", price: 0.99),
      Addon(name: "Mint garnish", price: 0.49),
    ],
  ),

  Food(
     name: "Danish Pastries",
  description: "Flaky, buttery pastries filled with fruit jam, cream cheese, or custard.",
  imagePath: "lib/images/desserts/danish_pastries.jpg",
  price: 3.99,
  category: FoodCategory.desserts,
  availableAddons: [
    Addon(name: "Extra fruit jam", price: 0.79),
    Addon(name: "Powdered sugar dusting", price: 0.49),
    ],
  ),

  Food(
     name: "Sorbet",
  description: "A refreshing frozen dessert made with fresh fruit and a hint of citrus.",
  imagePath: "lib/images/desserts/sorbet.jpg",
  price: 2.99,
  category: FoodCategory.desserts,
  availableAddons: [
    Addon(name: "Extra fruit topping", price: 0.69),
    Addon(name: "Lemon zest", price: 0.49),
    ],
  ),


  //drinks

  Food(
    name: "Italian Drink",
    description: "A refreshing blend of sparkling water, citrus, and Italian herbs.",
    imagePath: "lib/images/drinks/italian.jfif",
    price: 1.99,
    category: FoodCategory.drinks,
    availableAddons: [
      Addon(name: "Lemon wedge", price: 0.49),
      Addon(name: "Extra herbs", price: 0.49),
    ],
  ),

  Food(
    name: "Summer Cocktail",
    description: "A fruity cocktail with tropical flavors and a hint of mint.",
    imagePath: "lib/images/drinks/summer.jfif",
    price: 2.99,
    category: FoodCategory.drinks,
    availableAddons: [
      Addon(name: "Extra fruit garnish", price: 0.99),
      Addon(name: "Umbrella decor", price: 0.49),
    ],
  ),

  Food(
    name: "Sun Cocktail",
    description: "A vibrant mix of orange juice, cranberry, and a touch of grenadine.",
    imagePath: "lib/images/drinks/sun_cocktail.jpg",
    price: 2.79,
    category: FoodCategory.drinks,
    availableAddons: [
      Addon(name: "Ice cubes", price: 0.49),
      Addon(name: "Extra grenadine", price: 0.49),
    ],
  ),


  Food(
    name: "Sun Smoothie",
  description: "A vibrant mix of orange juice, cranberry, and a touch of grenadine blended into a smooth, refreshing drink.",
  imagePath: "lib/images/drinks/smoothy.jfif",
  price: 2.79,
  category: FoodCategory.drinks,
  availableAddons: [
    Addon(name: "Ice cubes", price: 0.49),
    Addon(name: "Extra grenadine", price: 0.49),
    ],
  ),

  Food(
    name: "Caramel Macchiato",
  description: "A delicious espresso drink with steamed milk and a rich caramel flavor, topped with a drizzle of caramel syrup.",
  imagePath: "lib/images/drinks/caremel.jpg",
  price: 3.49,
  category: FoodCategory.drinks,
  availableAddons: [
    Addon(name: "Extra caramel drizzle", price: 0.69),
    Addon(name: "Whipped cream", price: 0.59),
    ],
  ),

   //salad

  Food(
    name: "Cobb Salad",
    description: "A fresh mix of greens, crispy bacon, chicken, and boiled eggs, topped with a creamy dressing.",
    imagePath: "lib/images/salads/cobb_salad.jfif",
    price: 3.49,
    category: FoodCategory.salads,
    availableAddons: [
      Addon(name: "Extra chicken", price: 1.99),
      Addon(name: "Avocado slices", price: 1.49),
    ],
  ),

  Food(
    name: "Green Salad",
    description: "A healthy mix of fresh greens, cucumbers, and a light vinaigrette.",
    imagePath: "lib/images/salads/green_salad.jfif",
    price: 2.49,
    category: FoodCategory.salads,
    availableAddons: [
      Addon(name: "Extra cucumbers", price: 0.49),
      Addon(name: "Cheese crumbles", price: 0.99),
    ],
  ),

  Food(
    name: "Grilled Chicken Ranch Salad",
    description: "Grilled chicken served over a bed of greens with ranch dressing and croutons.",
    imagePath: "lib/images/salads/grilled_chicken_ranch.jpg",
    price: 3.99,
    category: FoodCategory.salads,
    availableAddons: [
      Addon(name: "Extra ranch dressing", price: 0.49),
      Addon(name: "Cheese crumbles", price: 0.99),
    ],
  ),

  Food(
    name: "Quinoa Salad",
  description: "A healthy mix of quinoa, fresh vegetables, and a zesty lemon vinaigrette.",
  imagePath: "lib/images/salads/quinoa.jpg",
  price: 4.99,
  category: FoodCategory.salads,
  availableAddons: [
    Addon(name: "Extra lemon vinaigrette", price: 0.49),
    Addon(name: "Avocado slices", price: 1.49),
    Addon(name: "Toasted almonds", price: 0.99),
    ],
  ),

  Food(
    name: "Caesar Salad",
  description: "Crisp romaine lettuce with Caesar dressing, croutons, and parmesan cheese.",
  imagePath: "lib/images/salads/seasor_salad.jpg",
  price: 4.49,
  category: FoodCategory.salads,
  availableAddons: [
    Addon(name: "Extra Caesar dressing", price: 0.49),
    Addon(name: "Grilled chicken", price: 1.99),
    Addon(name: "Bacon bits", price: 1.49),
    ],
  ),


  //sides

  Food(
    name: "Gluten-Free Side",
    description: "A simple yet delicious gluten-free side with fresh seasonal vegetables.",
    imagePath: "lib/images/sides/gluten.jfif",
    price: 1.99,
    category: FoodCategory.sides,
    availableAddons: [
      Addon(name: "Extra veggies", price: 0.99),
      Addon(name: "Herb seasoning", price: 0.49),
    ],
  ),
  Food(
    name: "Potato Salad",
    description: "A creamy potato salad with herbs and a hint of mustard.",
    imagePath: "lib/images/sides/potato_salad.webp",
    price: 2.49,
    category: FoodCategory.sides,
    availableAddons: [
      Addon(name: "Extra potatoes", price: 0.99),
      Addon(name: "Bacon bits", price: 1.49),
    ],
  ),

  Food(
    name: "Unfussy Vegetable Side",
    description: "A simple yet flavorful mix of steamed vegetables with light seasoning.",
    imagePath: "lib/images/sides/unfussy_vegetable.jpeg",
    price: 1.79,
    category: FoodCategory.sides,
    availableAddons: [
      Addon(name: "Extra seasoning", price: 0.49),
      Addon(name: "Butter drizzle", price: 0.49),
    ],
  ),

  Food(
    name: "Crispy Mac and Cheesy Bites",
  description: "Golden-brown, bite-sized snacks filled with creamy mac and cheese.",
  imagePath: "lib/images/sides/crispy.jfif",
  price: 2.49,
  category: FoodCategory.sides,
  availableAddons: [
    Addon(name: "Garlic bread", price: 1.29),
    Addon(name: "Extra cheese drizzle", price: 0.79)
    ],
  ),

   Food(
    name: "Garlic Bread",
description: "Warm, crispy bread slices infused with rich garlic butter and herbs.",
imagePath: "lib/images/sides/garlic.jpg",
price: 1.29,
category: FoodCategory.sides,
availableAddons: [
  Addon(name: "Extra garlic butter", price: 0.50),
  Addon(name: "Cheese topping", price: 0.79),
    ],
  ),

  

];

 // user cart
 final List<CartItem> cart = [];

 //delivery Address 
 String deliveryAddress = '99 Hollywood Blv';

/*
G E T T E R S
*/

List<Food> get menu => _menu;
List<CartItem> get _cart => cart;
String get _deliveryAddress => deliveryAddress;

/*
O P E R A T I O N S
*/



  

//add to cart
void addToCart(Food food, List<Addon> selectedAddons){
  // see if there is a cart item already with the same food and selected addons

  CartItem? cartItem = _cart.firstWhereOrNull((item){
    //check if the food items are the same
    bool isSameFood = item.food == food;

    //check if the list of selected addons are the same
    bool isSameAddons = 
      ListEquality().equals(item.selectedAddons,selectedAddons);
    return isSameFood && isSameAddons;

  });

  // if item already exists, increase it's quantity
  if (cartItem != null){
    cartItem.quantity++;
  }

  //otherwise add to the cart item to the cart
  else{
    _cart.add(
      CartItem(
        food: food, 
        selectedAddons: selectedAddons
      )
    );
  }
  notifyListeners();
}

//remove from cart
void removeFromCart(CartItem cartItem){
  int cartIndex = _cart.indexOf(cartItem);

  if (cartIndex !=1){
    if (_cart[cartIndex].quantity>1){
      _cart[cartIndex].quantity--;
    }
    else {
      _cart.removeAt(cartIndex);
    }
  }
  notifyListeners();
}

// get total price of cart
double getTotalPrice(){
  double total = 0.0;

  for (CartItem cartItem in _cart){
    double itemTotal = cartItem.food.price;

    for(Addon addon in cartItem.selectedAddons){
      itemTotal+=addon.price;
    }

    total += itemTotal*cartItem.quantity;
  }
  return total;
}

// get total number of items in cart
int getTotalItemCount() {
  int totalItemCount = 0;

  for (CartItem cartItem in _cart) {
    totalItemCount += cartItem.quantity;
  }

  return totalItemCount;
}


//clear cart
void clearCart() {
  _cart.clear();
  notifyListeners();
}

//update delivery address
void updateDeliveryAddress(String newAddress) {
  deliveryAddress = newAddress;
  notifyListeners();
}

/*
H E L P E R S
*/

// generate a receipt

String displayCartReceipt() {
  

  final receipt = StringBuffer();
  receipt.writeln("Here's your receipt.");
  receipt.writeln();
  
 // format the dtae to include up to seconds only
 String formattedDate = 
 DateFormat('yyyy-MM-dd HH:ss').format(DateTime.now());



 receipt.writeln(formattedDate);
 receipt.writeln();
 receipt.writeln("__________");


  for (final cartItem in _cart) {
    receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");

    if (cartItem.selectedAddons.isNotEmpty) {
      receipt.writeln("   Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
    }

    receipt.writeln();
  }

  receipt.writeln("_________");
  receipt.writeln();
  receipt.writeln("Total Items: ${getTotalItemCount()}");
  receipt.writeln();
  receipt.writeln("Delivering to : $deliveryAddress");
 
  
  // Call getTotalPrice as a function if it's a method
  receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

  return receipt.toString();
}

// Format double value into money
String _formatPrice(double price) {
  return "\$${price.toStringAsFixed(2)}";
}

// Format list of addons into a string summary
String _formatAddons(List<Addon> addons) {
  return addons
      .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
      .join(", ");
}

}

