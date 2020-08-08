import 'package:flutter/material.dart';
import 'package:mealapp/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routName = "/filter";

  final Function setFilter;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.setFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  @override
  initState() {
    glutenFree = widget.currentFilters["gluten"];
    vegetarian = widget.currentFilters["vegetarian"];
    vegan = widget.currentFilters["vegan"];
    lactoseFree = widget.currentFilters["lactose"];
    super.initState();
  }

  Widget setSwitch(
      String txt, String subTitle, bool currentVal, Function controller) {
    return SwitchListTile(
        activeColor: Colors.yellowAccent,
        title: Text(txt),
        value: currentVal,
        subtitle: Text(subTitle),
        onChanged: controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Map<String, bool> _filter = {
                  "gluten": glutenFree,
                  "lactose": lactoseFree,
                  "vegan": vegan,
                  "vegetarian": vegetarian
                };
                widget.setFilter(_filter);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                setSwitch("Gluten-Free", "Only includes gluten-free meals",
                    glutenFree, (newVal) {
                  setState(() {
                    glutenFree = newVal;
                  });
                }),
                setSwitch(
                    "Vegetarian", "Only includes Vegetarian meals", vegetarian,
                    (newVal) {
                  setState(() {
                    vegetarian = newVal;
                  });
                }),
                setSwitch("Vegan", "Only includes vegan meals", vegan,
                    (newVal) {
                  setState(() {
                    vegan = newVal;
                  });
                }),
                setSwitch("LactoseFree", "Only includes lactose-free meals",
                    lactoseFree, (newVal) {
                  setState(() {
                    lactoseFree = newVal;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
