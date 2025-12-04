import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamu_recipes/domain/usecases/recipe/get_random_recipe_use_case.dart';
import 'package:tamu_recipes/presentation/home/bloc/random_recipe_state.dart';
import 'package:tamu_recipes/presentation/service_locator.dart';

class RandomRecipeCubit extends Cubit<RandomRecipeState> {
  RandomRecipeCubit() : super(RandomRecipeLoading());

  void getRandomRecipes() async {
    var result = await serviceLocator<GetRandomRecipeApiUseCase>().call();
    result.fold(
        (error) {
          emit(FailureLoadRandomRecipes(errorMessage: error));
        },
        (data) {
          emit(RandomRecipeLoaded(recipes: data));
        }
    );
  }
}