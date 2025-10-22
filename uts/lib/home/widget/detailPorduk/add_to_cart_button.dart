import 'package:flutter/material.dart';
import 'package:uts/cart/pages/shopping_cart_page.dart';
import 'package:uts/theme/colors.dart';


class AddToCartButton extends StatelessWidget {
  final String nama;
  final String harga;
  final String gambar;
  final int jumlah;
  final Color? backgroundColor;

  const AddToCartButton({
    super.key,
    required this.nama,
    required this.harga,
    required this.gambar,
    required this.jumlah,
    this.backgroundColor, required Null Function() onAdd,
  });

  @override
  Widget build(BuildContext context) {
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
          Navigator.push(
            context,
            MaterialPageBuilder(),
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

  // ignore: non_constant_identifier_names
  PageRouteBuilder MaterialPageBuilder() {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => ShoppingCartPage(
        cartItems: [
          {
            "name": nama,
            "weight": "1 pcs",
            "price": double.tryParse(
                    harga.replaceAll(RegExp(r'[^0-9.]'), '')) ??
                0.0,
            "quantity": jumlah,
            "image": gambar,
            "circleColor": backgroundColor ?? Colors.green.shade50,
          },
        ],
      ),
      transitionsBuilder: (_, animation, __, child) {
        final tween = Tween(begin: const Offset(1, 0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.easeInOut));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}
