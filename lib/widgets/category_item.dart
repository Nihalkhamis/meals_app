import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color? color;

  const CategoryItem(
      {Key? key, required this.id, required this.title, this.color})
      : super(key: key);

  // 1-push()

  // void selectCategory(BuildContext context) {
  //   Navigator.of(context).push(MaterialPageRoute(builder: (_) {
  //     return CategoryMealsScreen(id: id, title: title,);
  //   }));
  // }


  // 2-pushNamed()

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        "id" : id,
        "title" : title,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(     // give me the effect of highlighting in the background of the container when pressing on it
      splashColor: Theme.of(context).primaryColor,
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color!.withOpacity(0.7),
              color!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(title, style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}
