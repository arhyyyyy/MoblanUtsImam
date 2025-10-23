import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts/cart/pages/shopping_cart_page.dart';
import 'package:uts/data/providers/cart_provider.dart';
import 'package:uts/theme/colors.dart';

class AddToCartButton extends StatelessWidget {
  final String nama;
  final String harga;
  final String gambar;
  final int jumlah;
  final Color? backgroundColor;
  final VoidCallback onAdd;

  const AddToCartButton({
    super.key,
    required this.nama,
    required this.harga,
    required this.gambar,
    required this.jumlah,
    this.backgroundColor,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: () {
          cartProvider.addToCart(nama, harga, jumlah, gambar);
          onAdd();
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const ShoppingCartPage(),
              transitionsBuilder: (_, animation, __, child) {
                final tween = Tween(begin: const Offset(1, 0), end: Offset.zero)
                    .chain(CurveTween(curve: Curves.easeInOut));
                return SlideTransition(position: animation.drive(tween), child: child);
              },
            ),
          );
        },
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.primaryDark],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: const [
              Center(
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                right: 20,
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}