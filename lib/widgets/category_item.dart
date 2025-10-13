import 'package:flutter/material.dart';

import 'package:foodrecipeapp/models/category.dart';
import 'package:foodrecipeapp/models/meal.dart';
import 'package:foodrecipeapp/screens/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.availableMeal,
    required this.toggleFavouriteMeal,
  });

  final Category category;
  final List<Meal> availableMeal;
  final Function(Meal meal) toggleFavouriteMeal;

  void _selectedMeals(BuildContext context) {
    final meals = availableMeal.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MealsScreen(
            meals: meals,
            category: category,
            toggleFavouriteMeal: toggleFavouriteMeal,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectedMeals(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: 0.55),
              category.color.withValues(alpha: 0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          category.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
