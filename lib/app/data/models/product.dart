import 'dart:convert';

class Product {
  final String uuid;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final int quantity;
  final String category;
  final String subCategory;
  final double rating;
  final int ratingCount;
  bool isFavorite;
  final bool isFeatured;

  Product({
    required this.uuid,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.category,
    required this.subCategory,
    required this.rating,
    required this.ratingCount,
    required this.isFavorite,
    this.isFeatured = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
      'category': category,
      'subCategory': subCategory,
      'rating': rating,
      'ratingCount': ratingCount,
      'isFavorite': isFavorite,
      'isFeatured': isFeatured,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      uuid: map['uuid'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
      category: map['category'] ?? '',
      subCategory: map['subCategory'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      ratingCount: map['ratingCount']?.toInt() ?? 0,
      isFavorite: map['isFavorite'] ?? false,
      isFeatured: map['isFeatured'] ?? false,
    );
  }

  String get priceString {
    return price.toStringAsFixed(2);
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
