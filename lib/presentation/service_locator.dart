import 'package:get_it/get_it.dart';
import 'package:tamu_recipes/data/repoimpl/recipe/recipe_repo_impl.dart';
import 'package:tamu_recipes/data/sources/recipe/recipe_api_service.dart';
import 'package:tamu_recipes/domain/repository/recipe/recipe_repository.dart';
import 'package:tamu_recipes/domain/usecases/recipe/get_random_recipe_use_case.dart';

import '../core/network/dio_client.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  
  serviceLocator.registerSingleton<DioClient>(DioClient());

  serviceLocator.registerSingleton<RecipeApiService>(RecipeApiServiceImpl());

  serviceLocator.registerSingleton<RecipeRepository>(RecipeRepoImpl());

  serviceLocator.registerSingleton<GetRandomRecipeApiUseCase>(GetRandomRecipeApiUseCase());

}