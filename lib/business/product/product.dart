import '../category/category.dart';

class Product {
  final int id;
  final Category category;
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  Product copyWith({
    int? id,
    Category? category,
    String? name,
    double? price,
    String? imageUrl,
  }) {
    return Product(
      id: id ?? this.id,
      category: category ?? this.category,
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, category: $category, name: $name, price: $price, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.category == category &&
        other.name == name &&
        other.price == price &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        category.hashCode ^
        name.hashCode ^
        price.hashCode ^
        imageUrl.hashCode;
  }
}
