import 'package:flutter_riverpod/legacy.dart';
import 'package:foodrecipeapp/screens/filter_screen.dart';

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
    : super({
        Filter.glutenFree: false,
        Filter.lactoseFree: false,
        Filter.vegetarian: false,
        Filter.vegan: false,
      });

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
  (ref) {
    return FilterNotifier();
  },
);
