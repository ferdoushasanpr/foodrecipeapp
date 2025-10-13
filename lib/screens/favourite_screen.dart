import 'package:flutter/material.dart';

import 'package:foodrecipeapp/models/meal.dart';
import 'package:foodrecipeapp/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({
    super.key,
    required this.meals,
    required this.toggleFavouriteMeal,
  });

  final List<Meal> meals;
  final Function(Meal meal) toggleFavouriteMeal;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) {
        return MealItem(
          fromWhere: "favourite",
          meal: meals[index],
          toggleFavouriteMeal: toggleFavouriteMeal,
        );
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
