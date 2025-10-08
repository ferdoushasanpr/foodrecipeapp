import 'package:flutter/material.dart';
import 'package:foodrecipeapp/models/category.dart';
import 'package:foodrecipeapp/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, required this.category});

  final Category category;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text(
        "The Recipes for the selected category will be shown here!",
        style: TextStyle(color: Colors.white),
      ),
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
