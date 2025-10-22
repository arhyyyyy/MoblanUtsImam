// lib/home/data/category_data.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<Map<String, dynamic>> categories = [
  {
    'icon': (Color color) => Icon(FontAwesomeIcons.leaf, color: color, size: 25),
    'title': 'Vegetables',
    'color': Colors.green,
  },
  {
    'icon': (Color color) => Icon(FontAwesomeIcons.appleWhole, color: color, size: 25),
    'title': 'Fruits',
    'color': Colors.redAccent,
  },
  {
    'icon': (Color color) => Icon(FontAwesomeIcons.mugSaucer, color: color, size: 25),
    'title': 'Beverages',
    'color': Colors.orange,
  },
  {
    'icon': (Color color) => Icon(FontAwesomeIcons.basketShopping, color: color, size: 25),
    'title': 'Grocery',
    'color': Colors.blue,
  },
  {
    'icon': (Color color) => Icon(FontAwesomeIcons.bottleDroplet, color: color, size: 25),
    'title': 'Edible oil',
    'color': Colors.purple,
  },
  {
    'icon': (Color color) => Icon(FontAwesomeIcons.houseChimney, color: color, size: 25),
    'title': 'Household',
    'color': Colors.teal,
  },
  {
    'icon': (Color color) => Icon(FontAwesomeIcons.baby, color: color, size: 25),
    'title': 'Babycare',
    'color': Colors.lightBlue,
  },
];
