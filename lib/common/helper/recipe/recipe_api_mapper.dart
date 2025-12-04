import 'package:tamu_recipes/data/models/randomrecipe/recipe_api_response.dart';
import 'package:tamu_recipes/domain/entities/recipe/recipe_entity.dart';

class RecipeApiMapper {
  static RecipeApiEntity toEntity(RecipeApiResponse recipes) {
    return RecipeApiEntity(
        id: recipes.id,
        image: recipes.image,
        imageType: recipes.imageType,
        title: recipes.title,
        readyInMinutes: recipes.readyInMinutes,
        servings: recipes.servings,
        sourceUrl: recipes.sourceUrl,
        vegetarian: recipes.vegetarian,
        vegan: recipes.vegan,
        glutenFree: recipes.glutenFree,
        dairyFree: recipes.dairyFree,
        veryHealthy: recipes.veryHealthy,
        cheap: recipes.cheap,
        veryPopular: recipes.veryPopular,
        sustainable: recipes.sustainable,
        lowFodmap: recipes.lowFodmap,
        weightWatcherSmartPoints: recipes.weightWatcherSmartPoints,
        gaps: recipes.gaps,
        preparationMinutes: recipes.preparationMinutes,
        cookingMinutes: recipes.cookingMinutes,
        aggregateLikes: recipes.aggregateLikes,
        healthScore: recipes.healthScore,
        creditsText: recipes.creditsText,
        license: recipes.license,
        sourceName: recipes.sourceName,
        pricePerServing: recipes.pricePerServing,
        extendedIngredients: [],//recipes.extendedIngredients,
        summary: recipes.summary,
        cuisines: recipes.cuisines,
        dishTypes: recipes.dishTypes,
        diets: recipes.diets,
        occasions: recipes.occasions,
        instructions: recipes.instructions,
        analyzedInstructions: [],//recipes.analyzedInstructions,
        originalId: recipes.originalId,
        spoonacularScore: recipes.spoonacularScore,
        spoonacularSourceUrl: recipes.spoonacularSourceUrl
    );
  }
}