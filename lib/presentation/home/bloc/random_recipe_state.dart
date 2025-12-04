import '../../../domain/entities/recipe/recipe_entity.dart';

abstract class RandomRecipeState{}

class RandomRecipeLoading extends RandomRecipeState{}

class RandomRecipeLoaded extends RandomRecipeState {
  final List<RecipeApiEntity> recipes;
  RandomRecipeLoaded({required this.recipes});
}

class FailureLoadRandomRecipes extends RandomRecipeState {
  final String errorMessage;
  FailureLoadRandomRecipes({required this.errorMessage});
}