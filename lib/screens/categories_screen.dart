import 'package:flutter/material.dart';

import 'package:foodrecipeapp/models/meal.dart';
import 'package:foodrecipeapp/widgets/category_item.dart';
import 'package:foodrecipeapp/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeal,
    required this.toggleFavouriteMeal,
  });

  final List<Meal> availableMeal;
  final Function(Meal meal) toggleFavouriteMeal;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      children: [
        for (var category in availableCategories)
          CategoryItem(
            category: category,
            availableMeal: availableMeal,
            toggleFavouriteMeal: toggleFavouriteMeal,
          ),
      ],
    );
  }
}
