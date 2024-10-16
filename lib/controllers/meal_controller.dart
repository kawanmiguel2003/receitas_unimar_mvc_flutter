import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:receitas_mvc_unimar/models/meal_model.dart';


class MealController {
  final String apiUrl = 'https://www.themealdb.com/api/json/v1/1/search.php?s=';

  Future<List<Meal>> fetchMeals(String query) async {
    final response = await http.get(Uri.parse(apiUrl + query));
    if (response.statusCode == 200) {
      final List meals = jsonDecode(response.body)['meals'];
      return meals.map((meal) => Meal.fromJson(meal)).toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
