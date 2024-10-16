import 'package:flutter/material.dart';
import 'package:receitas_mvc_unimar/models/meal_model.dart';
import 'package:receitas_mvc_unimar/controllers/favorite_controller.dart';
import 'package:provider/provider.dart';

class MealDetailView extends StatelessWidget {
  final Meal meal;

  MealDetailView({required this.meal});

  @override
  Widget build(BuildContext context) {
    final favoriteController = Provider.of<FavoriteController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.grey[850],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        meal.imageUrl,
                        width: 600, 
                        height: 600, 
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meal.name,
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          SizedBox(height: 8), 
                          Text(
                            'Categoria: ${meal.category}',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Área: ${meal.area}',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 8), 
                          Text("Instruções:", style: TextStyle(fontSize: 18, color: Colors.white)),
                          SizedBox(height: 4),
                          Text(
                            meal.instructions,
                            style: TextStyle(color: Colors.white),
                            maxLines: 10, 
                            overflow: TextOverflow.ellipsis, 
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: IconButton(
                    icon: Icon(
                      favoriteController.isFavorite(meal) ? Icons.favorite : Icons.favorite_border,
                      color: favoriteController.isFavorite(meal) ? Colors.red : Colors.white,
                    ),
                    onPressed: () {
                      favoriteController.toggleFavorite(meal);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}