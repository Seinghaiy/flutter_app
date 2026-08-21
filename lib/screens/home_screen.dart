import 'package:flutter/material.dart';
import '../models/products.dart';
import '../widgets/coffee_card.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Coffee list now built from the Product model instead of a raw Map.
  static final List<Product> _coffees = [
    Product(
      id: 1,
      name: 'Espresso',
      description: 'Strong and bold shot of coffee',
      price: 3.50,
      imageUrl: 'assets/images/coffee.jpg',
      category: 'Hot',
    ),
    Product(
      id: 2,
      name: 'Cappuccino',
      description: 'Espresso with steamed milk foam',
      price: 4.50,
      imageUrl: 'assets/images/coffee.jpg',
      category: 'Hot',
    ),
    Product(
      id: 3,
      name: 'Latte',
      description: 'Espresso with lots of steamed milk',
      price: 4.00,
      imageUrl: 'assets/images/coffee.jpg',
      category: 'Hot',
    ),
    Product(
      id: 4,
      name: 'Mocha',
      description: 'Espresso with chocolate and milk',
      price: 5.00,
      imageUrl: 'assets/images/coffee.jpg',
      category: 'Hot',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('☕ Coffee Shop'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        actions: [
          // Navigates to the Login screen.
          IconButton(
            icon: const Icon(Icons.login),
            tooltip: 'Login',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Our Coffees',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: _coffees.length,
                itemBuilder: (context, index) {
                  final coffee = _coffees[index];

                  return CoffeeCard(
                    imagePath: coffee.imageUrl,
                    name: coffee.name,
                    price: '\$${coffee.price.toStringAsFixed(2)}',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('You selected ${coffee.name}!'),
                          backgroundColor: Colors.brown,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}