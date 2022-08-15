import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler){
    return  ListTile(
      leading:  Icon(icon, size: 26,),
      title: Text(
        title,
        style: const TextStyle(
        fontWeight: FontWeight.bold,    //w700
        fontSize: 24,
        fontFamily: "RobotoCondensed",
      ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            child: Text("Cooking Up", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
            )),
          ),
          const SizedBox(height: 20,),
         buildListTile(
             "Meals",
             Icons.restaurant,
             (){
               Navigator.of(context).pushReplacementNamed("/");
             }
         ),
         buildListTile(
             "Settings",
             Icons.settings,
             (){
               Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
             }
         ),
        ],
      ),
    );
  }
}
