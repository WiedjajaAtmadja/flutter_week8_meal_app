// up to slide 43
import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'screens/recipe_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
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
      // theme: ThemeData(primarySwatch: Colors.blue),
      theme: theme,
      // home: const CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        RecipeScreen.routeName: (context) => const RecipeScreen(),
        DetailScreen.routeName: (context) =>
            DetailScreen(_toggleFavorite, _isMealFavorite),
      },
      // onUnknownRoute: (settings) => MaterialPageRoute(
      //       builder: (context) => const CategoriesScreen(),
      // )
    );
  }
}
