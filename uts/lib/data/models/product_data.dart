import 'package:flutter/material.dart';
import 'product_model.dart';
import '../../theme/colors.dart';

class ProductData {
  // Semua produk
  static List<ProductModel> allProducts = [
    ...getProductsByCategory('Fruits'),
    ...getProductsByCategory('Vegetables'),
    ...getProductsByCategory('Beverages'),
  ];

  // Produk per kategori
  static List<ProductModel> getProductsByCategory(String category) {
    switch (category) {
      case 'Fruits':
        return [
          ProductModel(
            id: '1',
            name: 'Apple',
            price: '\$3.21',
            unit: '2.5 lbs',
            image: 'images/Apel.png',
            description: 'Fresh Apple, great to eat or make juice',
            isNew: true,
            backgroundColor: Colors.redAccent,
          ),
          ProductModel(
            id: '2',
            name: 'Fresh Peach',
            price: '\$8.00',
            unit: 'dozen',
            image: 'images/Peach.png',
            description: 'Sweet and juicy fresh peaches',
            isNew: false,
            backgroundColor: Colors.orangeAccent,
          ),
          ProductModel(
            id: '3',
            name: 'Avocado',
            price: '\$7.00',
            unit: '2.0 lbs',
            image: 'images/Alvokat.png',
            description: 'Rich, creamy avocados — ideal for smoothies or salads',
            isNew: true,
            backgroundColor: const Color(0xFF6DC36E),
          ),
        ];
      case 'Vegetables':
        return [
          ProductModel(
            id: '4',
            name: 'Tomato',
            price: '\$2.50',
            unit: '1.0 lbs',
            image: 'images/Tomat.png',
            description: 'Fresh tomatoes for salads and cooking',
            isNew: false,
            backgroundColor: Colors.green,
          ),
          ProductModel(
            id: '5',
            name: 'Terong',
            price: '\$3.00',
            unit: '1.5 lbs',
            image: 'images/terong.png',
            description: 'Fresh purple terong',
            isNew: true,
            backgroundColor: Colors.greenAccent,
          ),
        ];
      case 'Beverages':
        return [
          ProductModel(
            id: '6',
            name: 'Orange Juice',
            price: '\$4.00',
            unit: '1 L',
            image: 'images/pakcoy.png',
            description: 'Freshly squeezed orange juice',
            isNew: false,
            backgroundColor: Colors.orange,
          ),
        ];
      default:
        return [];
    }
  }
}
