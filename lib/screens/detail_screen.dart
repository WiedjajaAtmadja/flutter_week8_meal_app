import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class DetailScreen extends StatelessWidget {
  static const String routeName = '/detail';
  final Function toggleFavorite;
  final Function isMealFavorite;

  const DetailScreen(this.toggleFavorite, this.isMealFavorite, {super.key});

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(
      MediaQueryData mediaQuery, AppBar appBar, Widget child) {
    return Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.3,
      // width: double.infinity,
      width: 300,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String id = routeArgs['id']!;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == id);
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(title: Text(selectedMeal.title));

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.3,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              mediaQuery,
              appBar,
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).secondaryHeaderColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              mediaQuery,
              appBar,
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isMealFavorite(id) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(id),
      ),
    );
  }
}
