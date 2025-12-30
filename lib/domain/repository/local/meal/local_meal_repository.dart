import 'package:dartz/dartz.dart';

abstract class LocalMealRepository {
  Future<Either> getMeal();
  Future<Either> addMeal(String title, String description);
  Future<Either> updateMealStatus(int id, int status);
  Future<Either> deleteMeal(int id);
}