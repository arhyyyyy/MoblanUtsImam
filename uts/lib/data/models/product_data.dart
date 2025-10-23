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
    const loremText =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

    switch (category) {
      case 'Fruits':
        return [
          ProductModel(
            id: '1',
            name: 'Fresh Peach',
            price: '\$3.21',
            unit: 'dozen',
            image: 'images/Peach.png',
            description: loremText,
            isNew: true,
            backgroundColor: Colors.redAccent,
          ),
          ProductModel(
            id: '2',
            name: 'Apple',
            price: '\$8.00',
            unit: '5.2 lbs',
            image: 'images/Apel.png',
            description: loremText,
            isNew: true,
            backgroundColor: Colors.red,
          ),
          ProductModel(
            id: '3',
            name: 'Avocado',
            price: '\$7.00',
            unit: '2.0 lbs',
            image: 'images/Alvokat.png',
            description: loremText,
            isNew: true,
            backgroundColor: const Color(0xFF6DC36E),
          ),
          ProductModel(
            id: '4',
            name: 'Lemon',
            price: '\$7.00',
            unit: '2.0 lbs',
            image: 'images/Lemon.png',
            description: loremText,
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
            description: loremText,
            isNew: false,
            backgroundColor: Colors.redAccent[200],
          ),
          ProductModel(
            id: '6',
            name: 'Boccoli',
            price: '\$5.00',
            unit: '1.5 lbs',
            image: 'images/broccoli.png',
            description: loremText,
            backgroundColor: Colors.green,
            discount: 5,
          ),
          ProductModel(
            id: '7',
            name: 'Pakcoy',
            price: '\$2.00',
            unit: '1 lbs',
            image: 'images/pakcoy.png',
            description: loremText,
            isNew: true,
            backgroundColor: Colors.green,
          ),
          ProductModel(
            id: '8',
            name: 'Carrot',
            price: '\$3.00',
            unit: '1.5 lbs',
            image: 'images/wortel.png',
            description: loremText,
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
            description: loremText,
            isNew: false,
            backgroundColor: Colors.orange,
          ),
          ProductModel(
            id: '10',
            name: 'Watermelon Juice',
            price: '\$4.00',
            unit: '1 L',
            image: 'images/watermelonjuice.png',
            description: loremText,
            isNew: false,
            backgroundColor: Colors.redAccent[100],
          ),
        ];
      case 'Grocery':
        return [
          ProductModel(
            id: '11',
            name: 'Shampoo',
            price: '\$2.00',
            unit: '1 L',
            image: 'images/shampoo.png',
            description: loremText,
            isNew: false,
            backgroundColor: Colors.grey,
          ),
          ProductModel(
            id: '12',
            name: 'Body Soap',
            price: '\$2.00',
            unit: '1 L',
            image: 'images/soap.png',
            description: loremText,
            isNew: false,
            backgroundColor: Colors.orange,
          ),
        ];
      case 'Edible oil':
        return [
          ProductModel(
            id: '13',
            name: 'Fortune Oil',
            price: '\$12.00',
            unit: '1.5 L',
            image: 'images/minyakgoreng.png',
            description: loremText,
            isNew: false,
            backgroundColor: Colors.yellow,
          ),
          ProductModel(
            id: '14',
            name: 'Sania Oil',
            price: '\$10.00',
            unit: '1.5 L',
            image: 'images/minyakgoreng2.png',
            description: loremText,
            isNew: false,
            backgroundColor: Colors.yellowAccent,
            discount: 20,
          ),
        ];
      case 'Household':
        return [
          ProductModel(
            id: '15',
            name: 'AC',
            price: '\$250.00',
            unit: '1 Unit',
            image: 'images/AC.png',
            description: loremText,
            isNew: false,
            backgroundColor: Colors.blueGrey,
            discount: 55,
          ),
          ProductModel(
            id: '16',
            name: 'Rice Cooker',
            price: '\$40.00',
            unit: '1 Unit',
            image: 'images/ricecooker.png',
            description: loremText,
            isNew: false,
            backgroundColor: Colors.blueGrey,
          ),
        ];
      case 'Babycare':
        return [
          ProductModel(
            id: '17',
            name: 'Diaper',
            price: '\$20.00',
            unit: '1',
            image: 'images/popok.png',
            description: loremText,
            isNew: false,
            backgroundColor: Colors.blue,
          ),
          ProductModel(
            id: '18',
            name: 'Milk',
            price: '\$30.00',
            unit: '600 ml',
            image: 'images/susu.png',
            description: loremText,
            isNew: false,
            backgroundColor: Colors.blueAccent,
          ),
        ];
      default:
        return [];
    }
  }
}
