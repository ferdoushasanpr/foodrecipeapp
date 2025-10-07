import 'package:flutter/material.dart';

import 'package:foodrecipeapp/widgets/category_item.dart';
import 'package:foodrecipeapp/data/dummy_data.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick Your Category")),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        children: [
          for (var category in availableCategories)
            CategoryItem(category: category),
        ],
      ),
    );
  }
}
