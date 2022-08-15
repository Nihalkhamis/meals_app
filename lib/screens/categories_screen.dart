import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(     // slivers are just a scrollable areas on the screen
        maxCrossAxisExtent: 200,  // max width of grid
        childAspectRatio: 3 / 2,   // 3 for height and 2 for width, according to maxCrossAxisExtent
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES.map((category) => CategoryItem(title: category.title, color: category.color, id: category.id,)).toList(),
    );
  }
}
