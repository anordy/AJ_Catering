class OrderModel {
  final String id;
  final String name;
  final String food;
  final String vegetable;
  final String fruit;
  final String icon;

  OrderModel(
      {required this.food,
      required this.vegetable,
      required this.fruit,
      required this.id,
      required this.name,
      required this.icon});
}

List<OrderModel> orderModels = [
  OrderModel(
      id: "1",
      name: 'Anord John',
      icon: 'AJ',
      food: 'Rice',
      vegetable: 'Chicken',
      fruit: 'Orange'),
  OrderModel(
      id: "2",
      name: 'Gerald Njau',
      icon: 'GN',
      food: 'Ugali',
      vegetable: 'Meat',
      fruit: 'Pineapple'),
  OrderModel(
      id: "3",
      name: 'Lucksford Isack',
      icon: 'LI',
      food: 'Makande',
      vegetable: 'Chicken',
      fruit: 'Banana'),
  OrderModel(
      id: "4",
      name: 'Shemmy Mgini',
      icon: 'SM',
      food: 'Chips',
      vegetable: 'Chicken',
      fruit: 'Orange'),
  OrderModel(
      id: "5",
      name: 'Peter Gati',
      icon: 'PG',
      food: 'Ugali',
      vegetable: 'Chicken',
      fruit: 'Banana'),
  OrderModel(
      id: "6",
      name: 'David Mabula',
      icon: 'DM',
      food: 'Ugali',
      vegetable: 'Roast',
      fruit: 'Banana'),
      OrderModel(
      id: "7",
      name: 'Hamis Chuma',
      icon: 'HC',
      food: 'Rice',
      vegetable: 'Roast',
      fruit: 'Banana'),
      OrderModel(
      id: "8",
      name: 'Victor Massawe',
      icon: 'VM',
      food: 'Ugali',
      vegetable: 'Meat',
      fruit: 'Banana'),
];
