import 'package:dartz/dartz.dart';
import 'package:tamu_recipes/core/usecase/usecase.dart';
import 'package:tamu_recipes/domain/entities/params/delete_meal_params.dart';
import 'package:tamu_recipes/domain/repository/local/meal/local_meal_repository.dart';
import 'package:tamu_recipes/presentation/service_locator.dart';

class DeleteMealUseCase extends UseCase<Either, DeleteMealParams> {

  final LocalMealRepository repository;

  DeleteMealUseCase(this.repository);

  @override
  Future<Either> call({DeleteMealParams? params}) {
    return repository.deleteMeal(params!.id);
  }
}
