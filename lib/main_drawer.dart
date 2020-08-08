import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/flters_screen.dart';
import 'package:mealapp/tab_bar-screen.dart';

class MainDrawer extends StatelessWidget {
  Widget selectTile(String title, IconData icon, Function tapHandel) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        tapHandel();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.yellowAccent,
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          selectTile(
            "Meal",
            Icons.restaurant,
            () {
              Navigator.of(context).pushNamed(TabScreen.routName); //or just /
            },
          ),
          selectTile(
            "Filter",
            Icons.settings,
            () {
              Navigator.of(context).pushNamed(FilterScreen.routName);
            },
          ),
        ],
      ),
    );
  }
}
