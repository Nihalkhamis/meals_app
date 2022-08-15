import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "category-meals";

  final List<Meal> availableMeals;

  const CategoryMealsScreen({Key? key, required this.availableMeals}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late List<Meal> displayedMeals;
  late String? categoryTitle;
  //var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){

    });

    WidgetsBinding.instance.addPostFrameCallback((_) {

    });
    // here we cannot use context cz the widget wont be fully created so we wont have the context yet
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("-------> 1 didChangeDependencies()");
   // if(!_loadedInitData){
      print("-------> 2 didChangeDependencies()");
      final routeArgs =
      ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs["title"];
      final categoryId = routeArgs["id"];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
   //   _loadedInitData = true;
   // }
  }

  void _removeMeal(String mealId) {
     setState(() {
       displayedMeals.removeWhere((meal) => meal.id == mealId);
     });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (cxt, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
