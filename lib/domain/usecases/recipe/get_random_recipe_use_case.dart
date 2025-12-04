import 'package:dartz/dartz.dart';
import 'package:tamu_recipes/core/usecase/usecase.dart';
import 'package:tamu_recipes/domain/repository/recipe/recipe_repository.dart';
import 'package:tamu_recipes/presentation/service_locator.dart';

class GetRandomRecipeApiUseCase extends UseCase<Either, dynamic> {

  @override
  Future<Either> call({params}) async {
    return await serviceLocator<RecipeRepository>().getRandomRecipes();
  }

}