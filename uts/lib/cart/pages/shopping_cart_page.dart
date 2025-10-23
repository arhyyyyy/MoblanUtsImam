import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts/cart/widget/cart_item_widget.dart';
import 'package:uts/cart/widget/empty_cart_widget.dart';
import 'package:uts/cart/widget/sumary_section.dart';
import 'package:uts/data/providers/cart_provider.dart';
import 'package:uts/home/pages/home.page.dart';
import 'package:uts/theme/colors.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    double subtotal = cartItems.fold(
      0,
      (sum, item) => sum + (item["price"] * item["quantity"]),
    );
    double shipping = cartItems.isEmpty ? 0 : 1.6;
    double total = subtotal + shipping;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          ),
        ),
        title: const Text(
          "Shopping Cart",
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: cartItems.isEmpty
          ? const EmptyCartWidget()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return CartItemWidget(
                        item: item,
                        onIncrement: () =>
                            cartProvider.incrementQuantity(item["name"]),
                        onDecrement: () =>
                            cartProvider.decrementQuantity(item["name"]),
                        onRemove: () =>
                            cartProvider.removeFromCart(item["name"]),
                      );
                    },
                  ),
                ),
                SummarySection(
                  subtotal: subtotal,
                  shipping: shipping,
                  total: total,
                ),
              ],
            ),
    );
  }
}
