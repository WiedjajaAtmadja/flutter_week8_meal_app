// up to slide 43
import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'recipe_screen.dart';
import 'detail_screen.dart';
import 'tabs_screen.dart';
import 'meal.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Meals',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: const CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        RecipeScreen.routeName: (context) => const RecipeScreen(),
        DetailScreen.routeName: (context) => const DetailScreen(),
      },
    );
  }
}
