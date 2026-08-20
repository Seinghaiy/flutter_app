import 'package:flutter/material.dart';
import 'widgets/coffee_card.dart'; // Import your widget


void main() {
  runApp(const MyCoffeeApp());
}

class MyCoffeeApp extends StatelessWidget {
  const MyCoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('☕ Coffee Shop'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
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
            
            // ✅ USE YOUR COFFEE CARD WIDGET HERE
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  final coffees = [
                    {
                      'name': 'Espresso',
                      'price': '\$3.50',
                      'image': 'assets/images/coffee.jpg',
                    },
                    {
                      'name': 'Cappuccino',
                      'price': '\$4.50',
                      'image': 'assets/images/coffee.jpg',
                    },
                    {
                      'name': 'Latte',
                      'price': '\$4.00',
                      'image': 'assets/images/coffee.jpg',
                    },
                    {
                      'name': 'Mocha',
                      'price': '\$5.00',
                      'image': 'assets/images/coffee.jpg',
                    },
                  ];
                  
                  final coffee = coffees[index];
                  
                  return CoffeeCard(
                    imagePath: coffee['image']!,
                    name: coffee['name']!,
                    price: coffee['price']!,
                    onTap: () {
                      // What happens when you tap the card
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('You selected ${coffee['name']}!'),
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