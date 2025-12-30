import 'package:tamu_recipes/data/models/meal/meal.dart';

abstract class MealState {}

class MealInitial extends MealState {}

class MealLoading extends MealState {}

class MealLoaded extends MealState {
  final List<Meal> meals;
  MealLoaded({required this.meals});
}

class MealFailure extends MealState {
  final String error;
  MealFailure({required this.error});
}