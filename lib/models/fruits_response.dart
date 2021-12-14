class FruitResponse {
  FruitResponse({
    required this.genus,
    required this.name,
    required this.id,
    required this.family,
    required this.order,
    required this.nutritions,
  });

  String genus;
  String name;
  int id;
  String family;
  String order;
  List<Nutritions> nutritions;

  factory FruitResponse.fromJson(Map<String, dynamic> json) => FruitResponse(
        genus: json["genus"],
        name: json["name"],
        id: json["id"],
        family: json["family"],
        order: json["order"],
        nutritions: List<Nutritions>.from(
            json["nutritions"].map((x) => Nutritions.fromJson(x))),
      );
}

class Nutritions {
  Nutritions({
    required this.carbohydrates,
    required this.protein,
    required this.fat,
    required this.calories,
    required this.sugar,
  });

  double carbohydrates;
  double protein;
  double fat;
  int calories;
  double sugar;

  factory Nutritions.fromJson(Map<String, dynamic> json) => Nutritions(
        carbohydrates: json["carbohydrates"].toDouble(),
        protein: json["protein"].toDouble(),
        fat: json["fat"].toDouble(),
        calories: json["calories"],
        sugar: json["sugar"].toDouble(),
      );
}
