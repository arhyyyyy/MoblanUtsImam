import 'package:flutter/material.dart';
import 'product_model.dart';
import '../../theme/colors.dart';

class ProductData {
  // Semua produk
  static List<ProductModel> allProducts = [
    ...getProductsByCategory('Fruits'),
    ...getProductsByCategory('Vegetables'),
    ...getProductsByCategory('Beverages'),
    ...getProductsByCategory('Grocery'),
    ...getProductsByCategory('Edible oil'),
    ...getProductsByCategory('Household'),
    ...getProductsByCategory('Babycare'),
  ];

  static List<ProductModel> getProductsByCategory(String category) {
    switch (category) {
      case 'Fruits':
        return [
          ProductModel(
            id: '1',
            name: 'Fresh Peach',
            price: '\$3.21',
            unit: 'dozen',
            image: 'images/Peach.png',
            description: 'Fresh Apple, great to eat or make juice',
            isNew: true,
            backgroundColor: Colors.redAccent,
          ),
          ProductModel(
            id: '2',
            name: 'Apple',
            price: '\$8.00',
            unit: '5.2 lbs',
            image: 'images/Apel.png',
            description: 'Sweet and juicy fresh peaches',
            isNew: true,
            backgroundColor: Colors.red,
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
          ProductModel(
            id: '4',
            name: 'Lemon',
            price: '\$7.00',
            unit: '2.0 lbs',
            image: 'images/Lemon.png',
            description: 'Lemon, good for your food',
            isNew: true,
            backgroundColor: const Color(0xFF6DC36E),
          ),
        ];
      case 'Vegetables':
        return [
          ProductModel(
            id: '5',
            name: 'Tomato',
            price: '\$2.50',
            unit: '1.0 lbs',
            image: 'images/Tomat.png',
            description: 'Fresh tomatoes for salads and cooking',
            isNew: false,
            backgroundColor: Colors.redAccent[200],
          ),
          ProductModel(
            id: '6',
            name: 'Boccoli',
            price: '\$5.00',
            unit: '1.5 lbs',
            image: 'images/broccoli.png',
            description: 'Fresh vagetables',
            isNew: true,
            backgroundColor: Colors.green,
            discount: '5',
          ),
          ProductModel(
            id: '7',
            name: 'Pakcoy',
            price: '\$2.00',
            unit: '1 lbs',
            image: 'images/pakcoy.png',
            description: 'Fresh vagetables',
            isNew: true,
            backgroundColor: Colors.green,
          ),
          ProductModel(
            id: '8',
            name: 'Carrot',
            price: '\$3.00',
            unit: '1.5 lbs',
            image: 'images/wortel.png',
            description: 'Fresh vagetables',
            isNew: true,
            backgroundColor: Colors.orange,
          ),
        ];
      case 'Beverages':
        return [
          ProductModel(
            id: '9',
            name: 'Orange Juice',
            price: '\$4.00',
            unit: '1 L',
            image: 'images/OrangeJuice.png',
            description: 'Freshly juice every day',
            isNew: false,
            backgroundColor: Colors.orange,
          ),
          ProductModel(
            id: '10',
            name: 'Watermelon Juice',
            price: '\$4.00',
            unit: '1 L',
            image: 'images/watermelonjuice.png',
            description: 'Freshly juice every day',
            isNew: false,
            backgroundColor: Colors.redAccent[100],
          ),
        ];
        case 'Grocery':
        return[
          ProductModel(
            id: '10',
            name: 'Shampoo',
            price: '\$2.00',
            unit: '1 L',
            image: 'images/shampoo.png',
            description: 'Shampoo for your hair',
            isNew: false,
            backgroundColor: Colors.grey,
          ),
          ProductModel(
            id: '11',
            name: 'Body Soap',
            price: '\$2.00',
            unit: '1 L',
            image: 'images/soap.png',
            description: 'Make your body clean',
            isNew: false,
            backgroundColor: Colors.orange,
          ),
        ];
        case 'Edible oil':
        return[
          ProductModel(
            id: '12',
            name: 'Fortune Oil',
            price: '\$12.00',
            unit: '1,5 L',
            image: 'images/minyakgoreng.png',
            description: 'cooking oil with premium ingredients',
            isNew: false,
            backgroundColor: Colors.yellow,
          ),
          ProductModel(
            id: '13',
            name: 'Sania Oil',
            price: '\$10.00',
            unit: '1,5 L',
            image: 'images/minyakgoreng2.png',
            description: 'cooking oil with premium ingredients',
            isNew: false,
            backgroundColor: Colors.yellowAccent,
          ),
        ];
        case 'Household':
        return[
        ProductModel(
          id: '14',
            name: 'AC',
            price: '\$250.00',
            unit: '1 Unit',
            image: 'images/AC.png',
            description: 'AC 1 PK',
            isNew: false,
            backgroundColor: Colors.blueGrey,
          ),
        ProductModel(
          id: '15',
            name: 'Rice Cooker',
            price: '\$40.00',
            unit: '1 Unit',
            image: 'images/ricecooker.png',
            description: 'For make rice',
            isNew: false,
            backgroundColor: Colors.blueGrey,
          )
        ]; 
        case 'Babycare':
        return[
        ProductModel(
          id: '16',
            name: 'Diaper',
            price: '\$250.00',
            unit: '1',
            image: 'images/popok.png',
            description: 'Diaper for baby',
            isNew: false,
            backgroundColor: Colors.blue,
          ),
        ProductModel(
          id: '17',
            name: 'Milk',
            price: '\$30.00',
            unit: '600 ml',
            image: 'images/susu.png',
            description: 'Milk for kids',
            isNew: false,
            backgroundColor: Colors.blueAccent,
          )
        ]; 
      default:
        return [];
    }
  }
}