import 'package:flutter/material.dart';
import 'package:foodrecipeapp/models/meal.dart';

import 'package:foodrecipeapp/screens/categories_screen.dart';
import 'package:foodrecipeapp/screens/favourite_screen.dart';
import 'package:foodrecipeapp/widgets/drawer_items.dart';

class FoodRecipeApp extends StatefulWidget {
  const FoodRecipeApp({super.key});

  @override
  State<FoodRecipeApp> createState() {
    return _FoodRecipeAppState();
  }
}

class _FoodRecipeAppState extends State<FoodRecipeApp> {
  int currentScreenIndex = 0;
  List<Meal> meals = [];

  List<Widget> get screens => [
    CategoriesScreen(addToFavourite: addToFavourite),
    FavouriteScreen(meals: meals, addToFavourite: addToFavourite),
  ];

  void _selectScreen(int index) {
    setState(() {
      currentScreenIndex = index;
    });
  }

  void addToFavourite(Meal meal) {
    if (meals.contains(meal)) {
      setState(() {
        meals.remove(meal);
      });
    } else {
      setState(() {
        meals.add(meal);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Food Recipe App")),
      drawer: Draweritems(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourite",
          ),
        ],
        onTap: _selectScreen,
        currentIndex: currentScreenIndex,
      ),
      body: screens[currentScreenIndex],
    );
  }
}
