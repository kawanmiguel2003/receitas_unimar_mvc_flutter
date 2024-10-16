import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitas_mvc_unimar/views/meal_list_view.dart';
import 'package:receitas_mvc_unimar/controllers/favorite_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteController(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        hintColor: Colors.orangeAccent,
      ),
      home: MealListView(),
    );
  }
}