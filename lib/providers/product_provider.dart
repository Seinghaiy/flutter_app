import 'package:flutter/material.dart';
import '../models/products.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  
  List<Product> get products => _products;
  
  void addProducts(List<Product> products) {
    _products = products;
    notifyListeners();
  }
  
  void toggleFavorite(String productId) {
    final index = _products.indexWhere((p) => p.id == productId);
    if (index != -1) {
      _products[index] = _products[index].copyWith(
        isFavorite: !_products[index].isFavorite,
      );
      notifyListeners();
    }
  }
  
  void updateRating(String productId, double newRating) {
    final index = _products.indexWhere((p) => p.id == productId);
    if (index != -1) {
      _products[index] = _products[index].copyWith(
        rating: newRating,
      );
      notifyListeners();
    }
  }


  
  List<Product> get favorites {
    return _products.where((p) => p.isFavorite).toList();
  }
}