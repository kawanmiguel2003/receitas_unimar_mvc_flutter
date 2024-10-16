import 'package:flutter/material.dart';
import 'package:receitas_mvc_unimar/models/meal_model.dart';

class FavoriteController with ChangeNotifier {
  List<Meal> _favorites = [];

  List<Meal> get favorites => _favorites;

  void toggleFavorite(Meal meal) {
    if (_favorites.contains(meal)) {
      _favorites.remove(meal);
    } else {
      _favorites.add(meal);
    }
    notifyListeners();
  }

  bool isFavorite(Meal meal) {
    return _favorites.contains(meal);
  }
}