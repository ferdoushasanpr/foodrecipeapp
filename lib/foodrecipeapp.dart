import 'package:flutter/material.dart';
import 'package:foodrecipeapp/data/dummy_data.dart';
import 'package:foodrecipeapp/models/meal.dart';

import 'package:foodrecipeapp/screens/categories_screen.dart';
import 'package:foodrecipeapp/screens/favourite_screen.dart';
import 'package:foodrecipeapp/widgets/drawer_items.dart';
import 'package:foodrecipeapp/screens/filter_screen.dart';

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

  Map<Filter, bool> _selectedMeals = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

  // Corrected Filter Logic
  List<Meal> get _availableMeals {
    return dummyMeals.where((meal) {
      if (_selectedMeals[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedMeals[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedMeals[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedMeals[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
  }

  List<Widget> get screens => [
    CategoriesScreen(
      availableMeal: _availableMeals,
      addToFavourite: addToFavourite,
    ),
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

  void getFilterResult(Map<Filter, bool> result) {
    setState(() {
      _selectedMeals = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Food Recipe App")),
      drawer: Draweritems(
        onSelectedMeal: getFilterResult,
        currentFilter: _selectedMeals,
      ),
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
