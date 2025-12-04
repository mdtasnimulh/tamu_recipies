import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamu_recipes/presentation/home/bloc/random_recipe_cubit.dart';
import 'package:tamu_recipes/presentation/home/bloc/random_recipe_state.dart';

class RandomRecipe extends StatelessWidget {
  const RandomRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RandomRecipeCubit()..getRandomRecipes(),
      child: BlocBuilder<RandomRecipeCubit, RandomRecipeState>(
        builder: (context, state) {
          if (state is RandomRecipeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is RandomRecipeLoaded) {
            return Center(
              child: Text(state.recipes.first.title.toString()),
            );
          }

          if (state is FailureLoadRandomRecipes) {
            return Center(
              child: Text(state.errorMessage),
            );
          }

          return Container();
        },
      ),
    );
  }
}
