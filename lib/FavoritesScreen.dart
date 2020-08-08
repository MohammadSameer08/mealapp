import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';

import 'meal-item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritesMeals;

  FavoritesScreen(this.favoritesMeals);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (favoritesMeals.isEmpty)
            ? Center(
                child: Text("No Favorites added yet!"),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return MealItem(
                    id: favoritesMeals[index].id,
                    //meal id
                    title: favoritesMeals[index].title,
                    //meal title
                    imageUrl: favoritesMeals[index].imageUrl,
                    duration: favoritesMeals[index].duration,
                    complexity: favoritesMeals[index].complexity,
                    affordability: favoritesMeals[index].affordability,
                    ingredients: favoritesMeals[index].ingredients,
                    steps: favoritesMeals[index].steps,
                  );
                },
                itemCount: favoritesMeals.length,
              ));
  }
}
