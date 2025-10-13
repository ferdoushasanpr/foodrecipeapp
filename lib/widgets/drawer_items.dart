import 'package:flutter/material.dart';
import 'package:foodrecipeapp/screens/filter_screen.dart';

class Draweritems extends StatelessWidget {
  const Draweritems({
    super.key,
    required this.onSelectedMeal,
    required this.currentFilter,
  });

  final Map<Filter, bool> currentFilter;
  final Function(Map<Filter, bool>) onSelectedMeal;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(
                    context,
                  ).colorScheme.primaryContainer.withValues(alpha: 0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.fastfood, size: 36),
                SizedBox(width: 12),
                Text(
                  "Food Recipe App",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(Icons.restaurant, size: 26),
            title: Text(
              "Meals",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          ListTile(
            onTap: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return FilterScreen(currentFilters: currentFilter);
                  },
                ),
              );
              if (result != null) {
                onSelectedMeal(result);
              }
            },
            leading: Icon(Icons.settings, size: 26),
            title: Text(
              "Filter",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
