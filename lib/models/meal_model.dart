class Meal {
  final String id;
  final String name;
  final String instructions;
  final String imageUrl;
  final List<String> ingredients;
  final String category; 
  final String area;     
  final String tags;    

  Meal({
    required this.id,
    required this.name,
    required this.instructions,
    required this.imageUrl,
    required this.ingredients,
    required this.category, 
    required this.area,     
    required this.tags,     
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      instructions: json['strInstructions'],
      imageUrl: json['strMealThumb'],
      ingredients: _extractIngredients(json),
      category: json['strCategory'] ?? '',
      area: json['strArea'] ?? '',         
      tags: json['strTags'] ?? '',         
    );
  }

  static List<String> _extractIngredients(Map<String, dynamic> json) {
    List<String> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
      }
    }
    return ingredients;
  }
}
