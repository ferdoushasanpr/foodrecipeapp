import 'package:flutter/material.dart';

import 'package:foodrecipeapp/models/category.dart';
import 'package:foodrecipeapp/models/meal.dart';
import 'package:foodrecipeapp/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    required this.category,
    required this.toggleFavouriteMeal,
  });

  final Category category;
  final List<Meal> meals;
  final Function(Meal meal) toggleFavouriteMeal;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) {
        return MealItem(
          fromWhere: "meals",
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
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: content,
    );
  }
}
