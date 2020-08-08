import 'package:flutter/material.dart';
import 'package:mealapp/category_meal-screen.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/flters_screen.dart';
import 'package:mealapp/meal-detail-screen.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/tab_bar-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoritesMeals = [];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;

      availableMeals = DUMMY_MEALS.where((meal) {
        if (_filter["gluten"] && !meal.isGlutenFree) return false;
        if (_filter["lactose"] && !meal.isLactoseFree) return false;
        if (_filter["vegan"] && !meal.isVegan) return false;
        if (_filter["vegetarian"] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }
   bool isFavorite(String id)
   {
     return favoritesMeals.any((meal) => meal.id==id);

   }
  void toggle(String mealId) {
    final exitingIndex = favoritesMeals.indexWhere((meal) => meal.id == mealId);
    if (exitingIndex >= 0) {
      setState(() {
        favoritesMeals.removeAt(exitingIndex);
      });
    } else {
      setState(() {
        favoritesMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                title: TextStyle(
                    fontFamily: "RobotoCondensed",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
      initialRoute: "/",
      routes: {
        "/": (ctx) => TabScreen(favoritesMeals),
        CategoryMealScreen.routName: (ctx) =>
            CategoryMealScreen(availableMeals),
        MealDetailScreen.routName:(ctx)=>MealDetailScreen(toggle,isFavorite),

        FilterScreen.routName: (ctx) => FilterScreen(_filter, _setFilter),
      },
    );
  }
}
