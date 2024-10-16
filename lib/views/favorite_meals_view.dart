import 'package:flutter/material.dart';
import 'package:receitas_mvc_unimar/controllers/favorite_controller.dart';
import 'package:provider/provider.dart';
import 'package:receitas_mvc_unimar/views/meal_detail_view.dart';

class FavoriteMealsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteController = Provider.of<FavoriteController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
      ),
      body: favoriteController.favorites.isEmpty
          ? Center(child: Text('Nenhuma receita favorita!', style: TextStyle(color: Colors.white)))
          : ListView.builder(
              itemCount: favoriteController.favorites.length,
              itemBuilder: (context, index) {
                final meal = favoriteController.favorites[index];
                return Card(
                  color: Colors.grey[850],
                  child: ListTile(
                    leading: Image.network(meal.imageUrl),
                    title: Text(meal.name, style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealDetailView(meal: meal),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      backgroundColor: Colors.black,
    );
  }
}
