import 'package:flutter/material.dart';

class MealItemTray extends StatelessWidget {
  const MealItemTray({super.key, required this.icon, required this.label});

  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(padding: const EdgeInsets.all(6), child: icon),
        Padding(
          padding: const EdgeInsets.all(6),
          child: Text(label, style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
