import 'package:get_it/get_it.dart';
import 'package:tamu_recipes/data/repoimpl/meal/local_meal_repo_impl.dart';
import 'package:tamu_recipes/data/repoimpl/recipe/recipe_repo_impl.dart';
import 'package:tamu_recipes/data/sources/meal/database_service.dart';
import 'package:tamu_recipes/data/sources/recipe/recipe_api_service.dart';
import 'package:tamu_recipes/domain/repository/local/meal/local_meal_repository.dart';
import 'package:tamu_recipes/domain/repository/recipe/recipe_repository.dart';
import 'package:tamu_recipes/domain/usecases/local/meal/add_meal_use_case.dart';
import 'package:tamu_recipes/domain/usecases/local/meal/delete_meal_use_case.dart';
import 'package:tamu_recipes/domain/usecases/local/meal/get_meal_use_case.dart';
import 'package:tamu_recipes/domain/usecases/local/meal/update_meal_use_case.dart';
import 'package:tamu_recipes/domain/usecases/recipe/get_random_recipe_use_case.dart';

import '../core/network/dio_client.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  serviceLocator.registerSingleton<DioClient>(DioClient());

  serviceLocator.registerSingleton<RecipeApiService>(RecipeApiServiceImpl());

  serviceLocator.registerLazySingleton<DatabaseService>(
    () => DatabaseServiceImpl(),
  );

  serviceLocator.registerSingleton<RecipeRepository>(RecipeRepoImpl());

  serviceLocator.registerLazySingleton<LocalMealRepository>(
    () => LocalMealRepoImpl(serviceLocator<DatabaseService>()),
  );

  serviceLocator.registerSingleton<GetRandomRecipeApiUseCase>(
    GetRandomRecipeApiUseCase(),
  );

  serviceLocator.registerLazySingleton<GetMealUseCase>(
        () => GetMealUseCase(serviceLocator<LocalMealRepository>()),
  );

  serviceLocator.registerLazySingleton<AddMealUseCase>(
        () => AddMealUseCase(serviceLocator<LocalMealRepository>()),
  );

  serviceLocator.registerLazySingleton<UpdateMealUseCase>(
        () => UpdateMealUseCase(serviceLocator<LocalMealRepository>()),
  );

  serviceLocator.registerLazySingleton<DeleteMealUseCase>(
        () => DeleteMealUseCase(serviceLocator<LocalMealRepository>()),
  );
}
