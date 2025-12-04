import 'package:dartz/dartz.dart';
import 'package:tamu_recipes/common/helper/recipe/recipe_api_mapper.dart';
import 'package:tamu_recipes/data/models/randomrecipe/recipe_api_response.dart';
import 'package:tamu_recipes/data/sources/recipe/recipe_api_service.dart';
import 'package:tamu_recipes/domain/repository/recipe/recipe_repository.dart';
import 'package:tamu_recipes/presentation/service_locator.dart';

class RecipeRepoImpl extends RecipeRepository {
  @override
  Future<Either> getRandomRecipes() async {
    var returnedData = await serviceLocator<RecipeApiService>()
        .getRandomRecipes();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var recipes = List.from(data['recipes']).map((item) => RecipeApiMapper.toEntity(RecipeApiResponse.fromJson(item))).toList();
        return Right(recipes);
      },
    );
  }
}
