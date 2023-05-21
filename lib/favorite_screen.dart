import 'package:flutter/material.dart';
import 'meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteScreen(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favorite Screen'),
    );
  }
}
