import 'package:flutter/material.dart';
import 'package:mealapp/FavoritesScreen.dart';
import 'package:mealapp/categories_screen.dart';
import 'package:mealapp/main_drawer.dart';

import 'models/meal.dart';

class TabScreen extends StatefulWidget {
  static const routName = "/";

  final List<Meal> favoritesMeals;


  TabScreen(this.favoritesMeals);

  @override
  _State createState() => _State();
}

//final List<Widget> pages = [CategoriesScreen(), FavoritesScreen()];

class _State extends State<TabScreen> {
  List<Map<String, dynamic>> pages = [];
  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    pages = [
      {"page": CategoriesScreen(), "title": "Categories"},
      {
        "page": FavoritesScreen(widget.favoritesMeals),
        "title": "Your Favorites"
      }
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]["title"]),
      ),
      body: pages[selectedPageIndex]["page"],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellowAccent,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("Categories")),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text("Favorites")),
        ],
      ),
    );
  }
}

// top TabBar.
/*

 Widget build(BuildContext context) {
  return DefaultTabController(
    // initialIndex: 0, by default it is 0.
    length: 2,
    child: Scaffold(
        appBar: AppBar(
          title: Text("DeliMeal"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.category), text: "Categories"),
              Tab(icon: Icon(Icons.star), text: "Favorites"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        )),
  );
}
  */