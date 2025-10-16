import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodrecipeapp/models/meal.dart';
import 'package:foodrecipeapp/providers/filter_provider.dart';
import 'package:foodrecipeapp/providers/meals_provider.dart';

import 'package:foodrecipeapp/screens/categories_screen.dart';
import 'package:foodrecipeapp/screens/favourite_screen.dart';
import 'package:foodrecipeapp/widgets/drawer_items.dart';
import 'package:foodrecipeapp/screens/filter_screen.dart';

class FoodRecipeApp extends ConsumerStatefulWidget {
  const FoodRecipeApp({super.key});

  @override
  ConsumerState<FoodRecipeApp> createState() {
    return _FoodRecipeAppState();
  }
}

class _FoodRecipeAppState extends ConsumerState<FoodRecipeApp> {
  int currentScreenIndex = 0;

  List<Meal> get _availableMeals {
    return ref.watch(mealProvider).where((meal) {
      if (ref.read(filterProvider)[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (ref.read(filterProvider)[Filter.lactoseFree]! &&
          !meal.isLactoseFree) {
        return false;
      }
      if (ref.read(filterProvider)[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (ref.read(filterProvider)[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
  }

  List<Widget> get screens => [
    CategoriesScreen(availableMeal: _availableMeals),
    FavouriteScreen(),
  ];

  void _selectScreen(int index) {
    setState(() {
      currentScreenIndex = index;
    });
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
