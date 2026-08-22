import 'package:flutter/material.dart';
import '../models/products.dart';
import '../widgets/coffee_card.dart';
import 'package:coffee_shop_app/widgets/rating_stars.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Sample products data
  List<Product> products = [
    Product(
      id: '1',
      name: 'Ice-Late',
      description: 'jog brab tha emm',
      price: 2.50,
      imageUrl: 'assets/images/Iec-late.jpg',
      rating: 4.5,
      isFavorite: false,
    ),
    Product(
      id: '2',
      name: 'Iced Caramel Latte',
      description: 'Perk tv kom kvol ah chkae',
      price: 4.50,
      imageUrl: 'assets/images/Iced Caramel Latte.jpg',
      rating: 4.8,
      isFavorite: true,
    ),
    Product(
      id: '3',
      name: 'Iced Caramel Latte',
      description: 'Perk tv kom kvol ah chkae',
      price: 4.50,
      imageUrl: 'assets/images/Iced Caramel Latte.jpg',
      rating: 4.8,
      isFavorite: true,
    ),
    Product(
      id: '4',
      name: 'Iced Caramel Latte',
      description: 'Perk tv kom kvol ah chkae',
      price: 4.50,
      imageUrl: 'assets/images/Iced Caramel Latte.jpg',
      rating: 4,
      isFavorite: true,
    ),
    // Add more products as needed
  ];

  void toggleFavorite(String productId) {
    setState(() {
      final index = products.indexWhere((p) => p.id == productId);
      if (index != -1) {
        products[index] = products[index].copyWith(
          isFavorite: !products[index].isFavorite,
        );
      }
    });
  }

  void updateRating(String productId, double newRating) {
    setState(() {
      final index = products.indexWhere((p) => p.id == productId);
      if (index != -1) {
        products[index] = products[index].copyWith(
          rating: newRating,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('☕Coffee Shop'),
        actions: [
          // Optional: Filter by favorites
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // Show only favorites
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return CoffeeCard(
            product: product,
            onFavoriteTap: () => toggleFavorite(product.id),
            onTap: () => _showProductDetail(context, product),
          );
        },
      ),
    );
  }

  void _showProductDetail(BuildContext context, Product product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Interactive Rating in detail view
            Row(
              children: [
                const Text('Rating: '),
                RatingStars(
                  rating: product.rating,
                  interactive: true,
                  onRatingChanged: (newRating) {
                    updateRating(product.id, newRating);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Price: \$${product.price.toStringAsFixed(2)}'),
            const SizedBox(height: 16),
            Text(product.description),
            const SizedBox(height: 20),
            // Favorite button in detail
            ElevatedButton.icon(
              onPressed: () {
                toggleFavorite(product.id);
                Navigator.pop(context);
              },
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              label: Text(
                product.isFavorite ? 'Remove from Favorites' : 'Add to Favorites',
              ),
            ),
          ],
        ),
      ),
    );
  }
}