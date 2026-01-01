import 'package:dartz/dartz.dart';
import 'package:tamu_recipes/core/usecase/usecase.dart';
import 'package:tamu_recipes/domain/repository/local/meal/local_meal_repository.dart';
import 'package:tamu_recipes/presentation/service_locator.dart';

class GetMealUseCase extends UseCase<Either, dynamic> {
  final LocalMealRepository repository;

  GetMealUseCase(this.repository);

  @override
  Future<Either> call({params}) async {
    return repository.getMeal();
  }
}