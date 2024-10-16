import 'package:flutter/material.dart';
import 'package:receitas_mvc_unimar/controllers/meal_controller.dart';
import 'package:receitas_mvc_unimar/models/meal_model.dart';
import 'package:receitas_mvc_unimar/views/meal_detail_view.dart';
import 'package:receitas_mvc_unimar/views/favorite_meals_view.dart';

class MealListView extends StatelessWidget {
  final MealController controller = MealController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Receitas Unimar'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteMealsView(),
                ),
              );
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: FutureBuilder<List<Meal>>(
        future: controller.fetchMeals(''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Erro ao carregar receitas',
                    style: TextStyle(color: Colors.white)));
          } else {
            final meals = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6, // Número de colunas
                childAspectRatio: 0.7, // Proporção do card (largura/altura)
                crossAxisSpacing: 40, // Espaçamento entre colunas
                mainAxisSpacing: 30, // Espaçamento entre linhas
              ),
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index];
                return Card(
                  color: Colors.grey[850],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MealDetailView(meal: meal),
                            ),
                          );
                        },
                        child: Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Image.network(
                              meal.imageUrl,
                              width: double.infinity,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MealDetailView(meal: meal),
                              ),
                            );
                          },
                          child: Text(
                            meal.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
