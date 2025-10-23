import 'package:flutter/material.dart';

class ProductModel {
  final String id;
  final String name;
  final String image;
  final String price;
  final String unit;
  final String description;
  final bool isNew;
  final double rating;
  final int ulasan;
  final Color? backgroundColor;
  final double? discount;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.unit,
    required this.description,
    this.isNew = false,
    this.rating = 4.5,
    this.ulasan = 89,
    this.backgroundColor,
    this.discount
  });
}
