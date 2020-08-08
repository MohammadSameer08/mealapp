import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routName = "/meal-detail-screen";

  String id;
  String imageUrl;
  List<String> ingredients;
  List<String> steps;

  Function toggle, isFavorites;

  MealDetailScreen(this.toggle, this.isFavorites);

  Widget buildTitle(String txt, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        txt,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    Map routsArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    id = routsArgs["id"];
    imageUrl = routsArgs["imageUrl"];
    ingredients = routsArgs["ingredients"];
    steps = routsArgs["steps"];

    return Scaffold(
      appBar: AppBar(title: Text(id)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Card(
                elevation: 4,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            buildTitle("Ingredients", context),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Colors.yellowAccent,
                    child: Text(ingredients[index]),
                  );
                },
                itemCount: ingredients.length,
              ),
            ),
            buildTitle("Steps", context),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text((index + 1).toString()),
                        ),
                        title: Text(steps[index]),
                      ),
                      Divider()
                    ],
                  );
                },
                itemCount: steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: isFavorites(id)
              ? Icon(
                  Icons.star,
                  color: Colors.yellowAccent,
                )
              : Icon(
                  Icons.star_border,
                  color: Colors.yellowAccent,
                ),
          onPressed: () {
            toggle(id);
          }),
    );
  }
}
