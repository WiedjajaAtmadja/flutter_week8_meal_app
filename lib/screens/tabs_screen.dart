import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen(this.favoriteMeals, {super.key});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // final List _pages = [
  //   {'page': const CategoriesScreen(), 'title': 'Categories'},
  //   {'page': const FavoriteScreen(), 'title': 'Favorites'},
  // ];
  // List<Map<String, Object>> _pages = [];
  var _pages = <Map<String, Object>>[];
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget.favoriteMeals), 'title': 'Favorites'},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    // length: 2,
    // child: Scaffold(
    //   appBar: AppBar(
    //     // title: Text(_pages[_selectedPageIndex]['title'] as String),
    //     title: const Text('Meals'),
    //     bottom: const TabBar(
    //       tabs: <Widget>[
    //         Tab(icon: Icon(Icons.category), text: 'Categories'),
    //         Tab(icon: Icon(Icons.star), text: 'Favorites'),
    //       ],
    //     ),
    //   ),
    //   body: TabBarView(
    //     children: <Widget>[
    //       const CategoriesScreen(),
    //       FavoriteScreen(widget.favoriteMeals),
    //     ],
    //   ),
    // ));

    return Scaffold(
      appBar:
          AppBar(title: Text(_pages[_selectedPageIndex]['title'] as String)),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).secondaryHeaderColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
