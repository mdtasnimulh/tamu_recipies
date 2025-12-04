import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tamu_recipes/core/configs/constants/app_urls.dart';
import 'package:tamu_recipes/core/network/dio_client.dart';
import 'package:tamu_recipes/presentation/service_locator.dart';

abstract class RecipeApiService {

  Future<Either> getRandomRecipes();

}

class RecipeApiServiceImpl extends RecipeApiService {

  @override
  Future<Either> getRandomRecipes() async {
    try {
      var response = await serviceLocator<DioClient>().get(
        AppUrls.randomRecipeUrl
      );
      return Right(response.data);
    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }

}