import 'package:dartz/dartz.dart';
import 'package:tamu_recipes/domain/entities/add_meal_params.dart';
import 'package:tamu_recipes/domain/repository/local/meal/local_meal_repository.dart';
import 'package:tamu_recipes/presentation/service_locator.dart';

import '../../../../core/usecase/usecase.dart';

class AddMealUseCase extends UseCase<Either, AddMealParams> {

  final LocalMealRepository repository;

  AddMealUseCase(this.repository);

  @override
  Future<Either> call({AddMealParams? params}) {
    return repository.addMeal(params!.title, params.description);
  }

}