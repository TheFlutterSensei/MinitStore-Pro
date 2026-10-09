class Product {
  final String id;
  final String image;
  final String title;
  final String shortDescription;
  final String detailedDescription;
  final double price;
  final bool inStock;
  final String category;
  final double rating;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.shortDescription,
    required this.detailedDescription,
    required this.price,
    required this.inStock,
    required this.category,
    required this.rating,
  });
}
