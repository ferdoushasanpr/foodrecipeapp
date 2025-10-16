import 'package:flutter_riverpod/legacy.dart';
import 'package:foodrecipeapp/models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  void toggleFavouriteMeal(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((stateMeal) {
        return stateMeal.id != meal.id;
      }).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
      return FavouriteMealsNotifier();
    });
