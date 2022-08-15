import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favMeals;
  const TabsScreen({Key? key, required this.favMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

   late List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        "title": "Categories",
        "page": const CategoriesScreen(),
      },
      {
        "title": "Favorites",
        "page": FavoritesScreen(favMeals: widget.favMeals),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return

        // to show bottom navigation
        Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"]),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,    // to bring some animation when navigation, so we must put background color in each item below
        items: const [
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: "Favorites",
          )
        ],
      ),
    );

    // to show tab bar at top under app bar

    // DefaultTabController(
    // // initialIndex: 0,
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text("Meals"),
    //       bottom: const TabBar(
    //           tabs: [
    //             Tab(
    //             icon: Icon(Icons.category),
    //             text: "Categories",
    //           ),
    //             Tab(
    //             icon: Icon(Icons.star),
    //             text: "Favorites",
    //           ),
    //           ]
    //       ),
    //     ),
    //     body: const TabBarView(children: [
    //       CategoriesScreen(),
    //       FavoritesScreen()
    //     ]),
    //   ));
  }
}
