class FoodModel {
  final String id;
  final String name;
  final String image;

  FoodModel({required this.id, required this.name, required this.image});
}

List<FoodModel> foodModels = [
  FoodModel(
      id: "1", name: 'Rice', image: 'assets/images/food2.jpg'),
  FoodModel(
      id: "2",
      name:
          'Ugali', image: 'assets/images/food1.jpg'),
  FoodModel(
      id: "3",
      name:
          "Makande.", image: 'assets/images/food2.jpg'),
  FoodModel(
      id: "4",
      name:
          'Chips', image: 'assets/images/food1.jpg'),
];
