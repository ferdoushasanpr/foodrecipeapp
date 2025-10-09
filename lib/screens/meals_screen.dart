import 'package:flutter/material.dart';

import 'package:foodrecipeapp/models/category.dart';
import 'package:foodrecipeapp/models/meal.dart';
import 'package:foodrecipeapp/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, required this.category});

  final Category category;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) {
        return MealItem(meal: meals[index]);
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
