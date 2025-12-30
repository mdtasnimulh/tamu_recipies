import 'package:dartz/dartz.dart';
import 'package:tamu_recipes/data/sources/meal/database_service.dart';
import 'package:tamu_recipes/domain/repository/local/meal/local_meal_repository.dart';

class LocalMealRepoImpl extends LocalMealRepository {
  final DatabaseService databaseService;
  LocalMealRepoImpl(this.databaseService);

  @override
  Future<Either> addMeal(String title, String description) async {
    return await databaseService.addMeal(title, description);
  }

  @override
  Future<Either> deleteMeal(int id) async {
    return await databaseService.deleteMeal(id);
  }

  @override
  Future<Either> getMeal() async {
    return await databaseService.getMeal();
  }

  @override
  Future<Either> updateMealStatus(int id, int status) async {
    return await databaseService.updateMealStatus(id, status);
  }

}