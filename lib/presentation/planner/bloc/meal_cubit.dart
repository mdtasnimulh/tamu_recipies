import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamu_recipes/domain/usecases/local/meal/add_meal_use_case.dart';
import 'package:tamu_recipes/domain/usecases/local/meal/delete_meal_use_case.dart';
import 'package:tamu_recipes/domain/usecases/local/meal/get_meal_use_case.dart';
import 'package:tamu_recipes/domain/usecases/local/meal/update_meal_use_case.dart';
import 'package:tamu_recipes/presentation/service_locator.dart';

import '../../../domain/entities/params/add_meal_params.dart';
import '../../../domain/entities/params/delete_meal_params.dart';
import '../../../domain/entities/params/update_meal_params.dart';
import 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealInitial());

  final _getMeals = serviceLocator<GetMealUseCase>();
  final _addMeal = serviceLocator<AddMealUseCase>();
  final _deleteMeal = serviceLocator<DeleteMealUseCase>();
  final _updateMeal = serviceLocator<UpdateMealUseCase>();

  Future<void> loadMeals() async {
    emit(MealLoading());

    final result = await _getMeals();

    result.fold(
          (error) => emit(MealFailure(error: error)),
          (meals) => emit(MealLoaded(meals: meals)),
    );
  }

  Future<void> addMeal(String title, String description) async {
    await _addMeal(
      params: AddMealParams(title: title, description: description),
    );
    loadMeals();
  }

  Future<void> deleteMeal(int id) async {
    await _deleteMeal(
      params: DeleteMealParams(id: id),
    );
    loadMeals();
  }

  Future<void> updateMealStatus(int id, int status) async {
    await _updateMeal(
      params: UpdateMealParams(id: id, status: status),
    );
    loadMeals();
  }
}
