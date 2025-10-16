import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:foodrecipeapp/providers/favourite_meals_provider.dart';
import 'package:foodrecipeapp/widgets/meal_item.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget content = ListView.builder(
      itemCount: ref.read(favouriteMealsProvider).length,
      itemBuilder: (ctx, index) {
        return MealItem(
          fromWhere: "favourite",
          meal: ref.read(favouriteMealsProvider)[index],
        );
      },
    );

    if (ref.read(favouriteMealsProvider).isEmpty) {
      content = Center(
        child: Text("No meals here!", style: TextStyle(color: Colors.white)),
      );
    }
    return content;
  }
}
