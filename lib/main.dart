import 'package:flutter/material.dart';
// import 'meal_app.dart';
import 'categories_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Meals',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: const MealApp(),
      home: const CategoriesScreen(),
    );
  }
}
