import 'package:flutter/material.dart';
import 'package:uts/cart/widget/cart_item_widget.dart';
import 'package:uts/cart/widget/empty_cart_widget.dart';
import 'package:uts/cart/widget/sumary_section.dart';
import 'package:uts/home/pages/home.page.dart';
import '../../theme/colors.dart';

class ShoppingCartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  const ShoppingCartPage({super.key, this.cartItems = const []});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  late List<Map<String, dynamic>> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = List.from(widget.cartItems);
  }

  void increment(int i) => setState(() => cartItems[i]["quantity"]++);
  void decrement(int i) => setState(() {
        if (cartItems[i]["quantity"] > 1) cartItems[i]["quantity"]--;
      });
  void remove(int i) => setState(() => cartItems.removeAt(i));

  double get subtotal => cartItems.fold(
      0, (sum, item) => sum + (item["price"] * item["quantity"]));
  double get shipping => cartItems.isEmpty ? 0 : 1.6;
  double get total => subtotal + shipping;

  @override
  Widget build(BuildContext context) {
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
        title: const Text("Shopping Cart",
            style: TextStyle(
                color: AppColors.textDark, fontWeight: FontWeight.bold)),
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
                    itemBuilder: (context, index) => CartItemWidget(
                      item: cartItems[index],
                      onIncrement: () => increment(index),
                      onDecrement: () => decrement(index),
                      onRemove: () => remove(index),
                    ),
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
