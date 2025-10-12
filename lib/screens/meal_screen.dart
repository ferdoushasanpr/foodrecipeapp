import 'package:flutter/material.dart';

import 'package:foodrecipeapp/models/meal.dart';
import 'package:foodrecipeapp/widgets/meal_item_tray.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    required this.meal,
    required this.addToFavourite,
  });

  final Meal meal;
  final Function(Meal meal) addToFavourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Recipes"),
        actions: [
          IconButton(
            onPressed: () {
              addToFavourite(meal);
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl),
            SizedBox(height: 20),
            Text(
              meal.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MealItemTray(
                  icon: Icon(Icons.schedule),
                  label: '${meal.duration} min',
                ),
                Text("|", style: TextStyle(color: Colors.white)),
                MealItemTray(
                  icon: Icon(Icons.work),
                  label: meal.complexity.name,
                ),
                Text("|", style: TextStyle(color: Colors.white)),
                MealItemTray(
                  icon: Icon(Icons.attach_money),
                  label: meal.affordability.name,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Column(
              children: [
                for (String ingredient in meal.ingredients)
                  Text(ingredient, style: TextStyle(color: Colors.white)),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Steps',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  for (String step in meal.steps)
                    Text(step, style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
