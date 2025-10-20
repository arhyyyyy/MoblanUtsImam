import 'product_model.dart';

class CartItemModel {
  final ProductModel product;
  int quantity;

  CartItemModel({
    required this.product,
    this.quantity = 1,
  });

  double get totalPrice {
    final priceValue = double.tryParse(product.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
    return priceValue * quantity;
  }
}
