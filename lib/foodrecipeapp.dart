import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodrecipeapp/data/dummy_data.dart';
import 'package:foodrecipeapp/models/meal.dart';
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
  List<Meal> meals = [];

  Map<Filter, bool> _selectedMeals = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

  List<Meal> get _availableMeals {
    return ref.watch(mealProvider).where((meal) {
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
      toggleFavouriteMeal: toggleFavouriteMeal,
    ),
    FavouriteScreen(meals: meals, toggleFavouriteMeal: toggleFavouriteMeal),
  ];

  void _selectScreen(int index) {
    setState(() {
      currentScreenIndex = index;
    });
  }

  void toggleFavouriteMeal(Meal meal) {
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
