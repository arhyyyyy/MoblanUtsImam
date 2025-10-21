import 'package:flutter/material.dart';
import 'package:uts/data/models/product_model.dart';
import 'package:uts/cart/pages/shopping_cart_page.dart';

class ProductAddButton extends StatelessWidget {
  final ProductModel product;
  final List<Map<String, dynamic>> cartItems;

  const ProductAddButton({
    super.key,
    required this.product,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cartItems.add({
          "product": product,
          "image": product.image,
          "name": product.name,
          "weight": product.unit,
          "price": double.tryParse(product.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0,
          "quantity": 1,
          "circleColor": product.backgroundColor ?? const Color(0xFF6DC36E),
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ShoppingCartPage(cartItems: cartItems),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFFF2F2F2))),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.shopping_bag_outlined, size: 18, color: Color(0xFF6DC36E)),
            SizedBox(width: 6),
            Text(
              "Add to cart",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
