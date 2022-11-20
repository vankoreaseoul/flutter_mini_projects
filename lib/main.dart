import 'package:flutter/material.dart';
import 'package:flutter_project/recipe.dart';
import 'package:flutter_project/recipe_detail.dart';

void main() {
  runApp(const RecipesApp());
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is the Recipes App'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
          return GestureDetector(onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return RecipeDetail(recipe: recipes[index]);
            }));
          },child: buildRecipeCard(recipes[index]));
      }, itemCount: recipes.length)
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(recipe.imageUrl),
            const SizedBox(
              height: 10,
            ),
            Text(recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino'),
            )
          ],
        ),
      ),
    );
  }

}

