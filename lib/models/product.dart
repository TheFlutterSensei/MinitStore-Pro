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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      shortDescription: json['shortDescription'],
      detailedDescription: json['detailedDescription'],
      price: (json['price'] as num).toDouble(),
      inStock: json['inStock'],
      category: json['category'],
      rating: (json['rating'] as num).toDouble(),
    );
  }
}
