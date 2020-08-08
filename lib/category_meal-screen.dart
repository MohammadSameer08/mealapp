import 'package:flutter/material.dart';

import 'package:mealapp/meal-item.dart';
import 'package:mealapp/models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routName = "/category-meals";

  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context)
  {


      Map routesArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    String title = routesArg["title"]; // category title
    String id = routesArg["id"]; //category id

    final categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
              //meal id
              title: categoryMeals[index].title,
              //meal title
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              ingredients: categoryMeals[index].ingredients,
              steps: categoryMeals[index].steps,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
/*
import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}

 */