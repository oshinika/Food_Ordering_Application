import 'package:flutter/material.dart';
import 'package:food/components/my_current_location.dart';
import 'package:food/components/my_description_box.dart';
import 'package:food/components/my_drawer.dart';
import 'package:food/components/my_food_tile.dart';
import 'package:food/components/my_silver_app_bar.dart';
import 'package:food/components/my_tab_bar.dart';
import 'package:food/models/food.dart';
import 'package:food/pages/food_page.dart';
import 'package:provider/provider.dart';
import 'package:food/models/restaurant.dart'; // Assuming Restaurant is the model providing `menu`

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  // Tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Filter food items by category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // Generate list of widgets for food items in each category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      
      //get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          //get individual food
          final food = categoryMenu[index];

          //return food tile UI
          return FoodTile(
            food: food, 
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> FoodPage(food: food),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                // Current location widget
                const MyCurrentLocation(),
                // Description box widget
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu), // Updated to use `menu`
          ),
        ),
      ),
    );
  }
}
