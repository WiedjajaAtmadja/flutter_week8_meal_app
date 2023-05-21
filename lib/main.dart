// up to slide 43
import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'recipe_screen.dart';
import 'detail_screen.dart';
import 'tabs_screen.dart';
import 'meal.dart';
import 'dummy_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    if (_favoriteMeals.indexWhere((meal) => meal.id == mealId) >= 0) {
      setState(() {
        _favoriteMeals
            .removeAt(_favoriteMeals.indexWhere((meal) => meal.id == mealId));
      });
    } else {
      setState(() {
        _favoriteMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Happy Meals',
        theme: ThemeData(primarySwatch: Colors.blue),
        // home: const CategoriesScreen(),
        routes: {
          '/': (context) => TabsScreen(_favoriteMeals),
          RecipeScreen.routeName: (context) => const RecipeScreen(),
          DetailScreen.routeName: (context) =>
              DetailScreen(_toggleFavorite, _isMealFavorite),
        },
        onUnknownRoute: (settings) => MaterialPageRoute(
              builder: (context) => const CategoriesScreen(),
            ));
  }
}
