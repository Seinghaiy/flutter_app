class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;        // Add this
  final bool isFavorite;      // Add this
  
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.rating = 0.0,
    this.isFavorite = false,
  });
  
  // Copy with method for updating properties
  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    double? rating,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}