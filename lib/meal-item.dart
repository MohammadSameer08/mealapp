import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mealapp/models/meal.dart';

import 'meal-detail-screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final List<String> ingredients;
  final List<String> steps;

  MealItem(
      {this.id,
      this.title,
      this.imageUrl,
      this.duration,
      this.complexity,
      this.affordability,
      this.ingredients,
      this.steps});

  String get complex {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "unknown";
    }
  }

  String get afford {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "unknown";
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routName, arguments: {
      "id": id,
      "imageUrl": imageUrl,
      "ingredients": ingredients,
      "steps": steps
    });

    /*Navigator.of(context).push(MaterialPageRoute(builder: (val) {
      return MealDetailScreen(id, imageUrl, ingredients, steps);
    }));*/
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectMeal(context),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 250,
                      color: Colors.black54,
                      padding: EdgeInsets.all(5),
                      child: FittedBox(
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.access_time),
                        SizedBox(
                          width: 6,
                        ),
                        Text(duration.toString() + "min")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(
                          width: 6,
                        ),
                        Text(complex)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 5,
                        ),
                        FittedBox(child: Text(afford))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
