import 'package:flutter/material.dart';

import 'package:foodrecipeapp/models/meal.dart';
import 'package:foodrecipeapp/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({
    super.key,
    required this.meals,
    required this.addToFavourite,
  });

  final List<Meal> meals;
  final Function(Meal meal) addToFavourite;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) {
        return MealItem(meal: meals[index], addToFavourite: addToFavourite);
      },
    );

    if (meals.isEmpty) {
      content = Center(
        child: Text("No meals here!", style: TextStyle(color: Colors.white)),
      );
    }
    return content;
  }
}
