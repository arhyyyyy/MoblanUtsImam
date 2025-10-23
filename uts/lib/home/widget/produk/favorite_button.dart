import 'package:flutter/material.dart';
import 'package:uts/data/favorite_manager.dart';
import 'package:uts/data/models/product_model.dart';

class FavoriteButton extends StatefulWidget {
  final ProductModel product;
  const FavoriteButton({super.key, required this.product});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = FavoriteManager.isFavorite(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          FavoriteManager.toggleFavorite(widget.product);
          isFavorite = !isFavorite;
        });
      },
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey[400],
        size: 22,
      ),
    );
  }
}
