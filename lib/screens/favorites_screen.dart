import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favMeals;
  const FavoritesScreen({Key? key, required this.favMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return const Center(
        child: Text("No fav meals - start adding some"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (cxt, index) {
          return MealItem(
            id: favMeals[index].id,
            title: favMeals[index].title,
            imageUrl: favMeals[index].imageUrl,
            duration: favMeals[index].duration,
            complexity: favMeals[index].complexity,
            affordability: favMeals[index].affordability,
            removeItem: (){},
          );
        },
        itemCount: favMeals.length,
      );
    }
  }
}
