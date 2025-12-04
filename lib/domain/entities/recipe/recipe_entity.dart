class RecipeApiEntity {
  RecipeApiEntity({
    required this.id,
    required this.image,
    required this.imageType,
    required this.title,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
    required this.vegetarian,
    required this.vegan,
    required this.glutenFree,
    required this.dairyFree,
    required this.veryHealthy,
    required this.cheap,
    required this.veryPopular,
    required this.sustainable,
    required this.lowFodmap,
    required this.weightWatcherSmartPoints,
    required this.gaps,
    required this.preparationMinutes,
    required this.cookingMinutes,
    required this.aggregateLikes,
    required this.healthScore,
    required this.creditsText,
    required this.license,
    required this.sourceName,
    required this.pricePerServing,
    required this.extendedIngredients,
    required this.summary,
    required this.cuisines,
    required this.dishTypes,
    required this.diets,
    required this.occasions,
    required this.instructions,
    required this.analyzedInstructions,
    required this.originalId,
    required this.spoonacularScore,
    required this.spoonacularSourceUrl,
  });

  final int? id;
  final String? image;
  final String? imageType;
  final String? title;
  final int? readyInMinutes;
  final int? servings;
  final String? sourceUrl;
  final bool? vegetarian;
  final bool? vegan;
  final bool? glutenFree;
  final bool? dairyFree;
  final bool? veryHealthy;
  final bool? cheap;
  final bool? veryPopular;
  final bool? sustainable;
  final bool? lowFodmap;
  final int? weightWatcherSmartPoints;
  final String? gaps;
  final dynamic preparationMinutes;
  final dynamic cookingMinutes;
  final int? aggregateLikes;
  final int? healthScore;
  final String? creditsText;
  final String? license;
  final String? sourceName;
  final double? pricePerServing;
  final List<ExtendedIngredient> extendedIngredients;
  final String? summary;
  final List<dynamic> cuisines;
  final List<String> dishTypes;
  final List<String> diets;
  final List<dynamic> occasions;
  final String? instructions;
  final List<AnalyzedInstruction> analyzedInstructions;
  final dynamic originalId;
  final double? spoonacularScore;
  final String? spoonacularSourceUrl;
}

class AnalyzedInstruction {
  AnalyzedInstruction({
    required this.name,
    required this.steps,
  });

  final String? name;
  final List<Step> steps;
}

class Step {
  Step({
    required this.number,
    required this.step,
    required this.ingredients,
    required this.equipment,
  });

  final int? number;
  final String? step;
  final List<Ent> ingredients;
  final List<Ent> equipment;
}

class Ent {
  Ent({
    required this.id,
    required this.name,
    required this.localizedName,
    required this.image,
  });

  final int? id;
  final String? name;
  final String? localizedName;
  final String? image;
}

class ExtendedIngredient {
  ExtendedIngredient({
    required this.id,
    required this.aisle,
    required this.image,
    required this.consistency,
    required this.name,
    required this.nameClean,
    required this.original,
    required this.originalName,
    required this.amount,
    required this.unit,
    required this.meta,
    required this.measures,
  });

  final int? id;
  final String? aisle;
  final String? image;
  final String? consistency;
  final String? name;
  final String? nameClean;
  final String? original;
  final String? originalName;
  final double? amount;
  final String? unit;
  final List<String> meta;
  final Measures? measures;
}

class Measures {
  Measures({
    required this.us,
    required this.metric,
  });

  final Metric? us;
  final Metric? metric;
}

class Metric {
  Metric({
    required this.amount,
    required this.unitShort,
    required this.unitLong,
  });

  final double? amount;
  final String? unitShort;
  final String? unitLong;
}