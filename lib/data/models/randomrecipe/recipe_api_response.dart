class RecipeApiResponse {
  RecipeApiResponse({
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

  factory RecipeApiResponse.fromJson(Map<String, dynamic> json){
    return RecipeApiResponse(
      id: json["id"],
      image: json["image"],
      imageType: json["imageType"],
      title: json["title"],
      readyInMinutes: json["readyInMinutes"],
      servings: json["servings"],
      sourceUrl: json["sourceUrl"],
      vegetarian: json["vegetarian"],
      vegan: json["vegan"],
      glutenFree: json["glutenFree"],
      dairyFree: json["dairyFree"],
      veryHealthy: json["veryHealthy"],
      cheap: json["cheap"],
      veryPopular: json["veryPopular"],
      sustainable: json["sustainable"],
      lowFodmap: json["lowFodmap"],
      weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
      gaps: json["gaps"],
      preparationMinutes: json["preparationMinutes"],
      cookingMinutes: json["cookingMinutes"],
      aggregateLikes: json["aggregateLikes"],
      healthScore: json["healthScore"],
      creditsText: json["creditsText"],
      license: json["license"],
      sourceName: json["sourceName"],
      pricePerServing: json["pricePerServing"],
      extendedIngredients: json["extendedIngredients"] == null ? [] : List<ExtendedIngredient>.from(json["extendedIngredients"]!.map((x) => ExtendedIngredient.fromJson(x))),
      summary: json["summary"],
      cuisines: json["cuisines"] == null ? [] : List<dynamic>.from(json["cuisines"]!.map((x) => x)),
      dishTypes: json["dishTypes"] == null ? [] : List<String>.from(json["dishTypes"]!.map((x) => x)),
      diets: json["diets"] == null ? [] : List<String>.from(json["diets"]!.map((x) => x)),
      occasions: json["occasions"] == null ? [] : List<dynamic>.from(json["occasions"]!.map((x) => x)),
      instructions: json["instructions"],
      analyzedInstructions: json["analyzedInstructions"] == null ? [] : List<AnalyzedInstruction>.from(json["analyzedInstructions"]!.map((x) => AnalyzedInstruction.fromJson(x))),
      originalId: json["originalId"],
      spoonacularScore: json["spoonacularScore"],
      spoonacularSourceUrl: json["spoonacularSourceUrl"],
    );
  }

}

class AnalyzedInstruction {
  AnalyzedInstruction({
    required this.name,
    required this.steps,
  });

  final String? name;
  final List<Step> steps;

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json){
    return AnalyzedInstruction(
      name: json["name"],
      steps: json["steps"] == null ? [] : List<Step>.from(json["steps"]!.map((x) => Step.fromJson(x))),
    );
  }

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

  factory Step.fromJson(Map<String, dynamic> json){
    return Step(
      number: json["number"],
      step: json["step"],
      ingredients: json["ingredients"] == null ? [] : List<Ent>.from(json["ingredients"]!.map((x) => Ent.fromJson(x))),
      equipment: json["equipment"] == null ? [] : List<Ent>.from(json["equipment"]!.map((x) => Ent.fromJson(x))),
    );
  }

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

  factory Ent.fromJson(Map<String, dynamic> json){
    return Ent(
      id: json["id"],
      name: json["name"],
      localizedName: json["localizedName"],
      image: json["image"],
    );
  }

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

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json){
    return ExtendedIngredient(
      id: json["id"],
      aisle: json["aisle"],
      image: json["image"],
      consistency: json["consistency"],
      name: json["name"],
      nameClean: json["nameClean"],
      original: json["original"],
      originalName: json["originalName"],
      amount: json["amount"],
      unit: json["unit"],
      meta: json["meta"] == null ? [] : List<String>.from(json["meta"]!.map((x) => x)),
      measures: json["measures"] == null ? null : Measures.fromJson(json["measures"]),
    );
  }

}

class Measures {
  Measures({
    required this.us,
    required this.metric,
  });

  final Metric? us;
  final Metric? metric;

  factory Measures.fromJson(Map<String, dynamic> json){
    return Measures(
      us: json["us"] == null ? null : Metric.fromJson(json["us"]),
      metric: json["metric"] == null ? null : Metric.fromJson(json["metric"]),
    );
  }

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

  factory Metric.fromJson(Map<String, dynamic> json){
    return Metric(
      amount: json["amount"],
      unitShort: json["unitShort"],
      unitLong: json["unitLong"],
    );
  }

}