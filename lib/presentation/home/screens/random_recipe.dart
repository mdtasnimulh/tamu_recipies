import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamu_recipes/presentation/home/bloc/random_recipe_cubit.dart';
import 'package:tamu_recipes/presentation/home/bloc/random_recipe_state.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

class RandomRecipe extends StatelessWidget {
  const RandomRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RandomRecipeCubit()..getRandomRecipes(),
      child: BlocBuilder<RandomRecipeCubit, RandomRecipeState>(
        builder: (context, state) {
          if (state is RandomRecipeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is RandomRecipeLoaded) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FanCarouselImageSlider.sliderType2(
                      imagesLink: state.recipes.map((e) => e.image ?? '').toList(),
                      isAssets: false,
                      autoPlay: false,
                      sliderHeight: 300,
                      currentItemShadow: const [],
                      sliderDuration: const Duration(milliseconds: 200),
                      imageRadius: 0,
                      slideViewportFraction: 1.2,
                    ),
                    SizedBox(height: 16,),
                    Text(state.recipes.first.title.toString())
                  ],
                ),
              ),
            );
          }

          if (state is FailureLoadRandomRecipes) {
            return Center(
              child: Text(state.errorMessage),
            );
          }

          return Container();
        },
      ),
    );
  }
}
