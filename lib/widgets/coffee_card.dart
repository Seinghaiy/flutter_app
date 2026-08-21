import 'package:flutter/material.dart';
import '../models/products.dart';
import 'rating_stars.dart';

class CoffeeCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onTap;
  
  const CoffeeCard({
    Key? key,
    required this.product,
    this.onFavoriteTap,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with Favorite Button overlay
              Stack(
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey[300],
                      image: product.imageUrl.isNotEmpty
                          ? DecorationImage(
                              image: AssetImage(product.imageUrl),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: product.isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: onFavoriteTap,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        iconSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Product Name
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Rating Stars
              RatingStars(
                rating: product.rating,
                size: 16,
              ),
              const SizedBox(height: 4),
              // Price
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}