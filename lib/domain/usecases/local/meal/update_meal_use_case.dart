import 'package:dartz/dartz.dart';
import 'package:tamu_recipes/core/usecase/usecase.dart';
import 'package:tamu_recipes/presentation/service_locator.dart';
import '../../../entities/params/update_meal_params.dart';
import '../../../repository/local/meal/local_meal_repository.dart';

class UpdateMealUseCase extends UseCase<Either, UpdateMealParams> {

  final LocalMealRepository repository;

  UpdateMealUseCase(this.repository);

  @override
  Future<Either> call({UpdateMealParams? params}) {
    return repository.updateMealStatus(params?.id as int, params?.status as int);
  }
}
