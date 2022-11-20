import 'package:flutter/material.dart';
import 'package:flutter_project/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.label),),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(width: double.infinity, height: 300,child: Image.asset(widget.recipe.imageUrl)),
            const SizedBox(
              height: 10,
            ),
            Text(widget.recipe.label,
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Palatino'),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Ingredient ingredient = widget.recipe.ingredients[index];

                return Text('${ingredient.quantity * sliderVal} ${ingredient.measure} ${ingredient.name}',
                textScaleFactor: 1.2);
              }, itemCount: widget.recipe.ingredients.length),
            ),
            Slider(
                min: 1,
                max: 10,
                divisions: 10,
                value: sliderVal.toDouble(),
                onChanged: (double newValue) {
                  setState(() {
                    sliderVal = newValue.round();
                  });
                },
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              label: '${sliderVal * widget.recipe.servings} servings',
            )
          ],
        ),
      ),
    );
  }
}
