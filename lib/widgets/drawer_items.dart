import 'package:flutter/material.dart';
import 'package:foodrecipeapp/screens/filter_screen.dart';

class Draweritems extends StatelessWidget {
  const Draweritems({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
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
            title: Text(
              "Meals",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return FilterScreen();
                  },
                ),
              );
            },
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
