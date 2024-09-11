class CoffeeModel {
  final String titleCoffee;
  final String description;
  final double price;
  final String imageUrl;
  late final bool isSelected;

  CoffeeModel({
    required this.imageUrl,
    required this.titleCoffee,
    required this.price,
    required this.description,
    required this.isSelected,
  });
}
