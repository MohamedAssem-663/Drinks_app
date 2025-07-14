class DrinkModel {
  final String name;
  final String image;
  final String descrebtion;
  final double price;

  DrinkModel({
    required this.name,
    required this.image,
    required this.descrebtion,
    required this.price,
  });
  static List<DrinkModel> drinks = [
    DrinkModel(
      name: 'Chocolate',
      image: 'assets/drinks/Chocolate.png',
      descrebtion: 'A delicious chocolate drink.',
      price: 25,
    ),
    DrinkModel(
      name: 'Banana',
      image: 'assets/drinks/Banana.png',
      descrebtion: 'A strong coffee to kickstart your day.',
      price: 24,
    ),
    DrinkModel(
      name: 'Brownie Island',
      image: 'assets/drinks/Brownie Island.png',
      descrebtion: 'A soothing cup of tea.',
      price: 23,
    ),
    DrinkModel(
      name: 'carmel',
      image: 'assets/drinks/carmel.png',
      descrebtion: 'A soothing cup of tea.',
      price: 22,
    ),
    DrinkModel(
      name: 'Peanut Butter',
      image: 'assets/drinks/Peanut Butter.png',
      descrebtion: 'A soothing cup of tea.',
      price: 15,
    ),
    DrinkModel(
      name: 'Salted Caramel',
      image: 'assets/drinks/Salted Caramel.png',
      descrebtion: 'A soothing cup of tea.',
      price: 18,
    ),
    DrinkModel(
      name: 'Strawberry',
      image: 'assets/drinks/Strawberry.png',
      descrebtion: 'A soothing cup of tea.',
      price: 21,
    ),
  ];
}
