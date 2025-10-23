import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts/cart/pages/shopping_cart_page.dart';
import 'package:uts/data/providers/cart_provider.dart';
import 'package:uts/data/models/product_model.dart';
import 'package:uts/home/widget/detailPorduk/add_to_cart_button.dart';
import 'package:uts/home/widget/detailPorduk/detail_header.dart';
import 'package:uts/home/widget/detailPorduk/detail_info_section.dart';
import 'package:uts/home/widget/detailPorduk/detail_quantity_selector.dart';
import '../../../theme/colors.dart';

class DetailProductPage extends StatefulWidget {
  final ProductModel product;

  const DetailProductPage({
    super.key,
    required this.product,
  });

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  int jumlah = 1;

  Color _getCircleColor(String title) {
    switch (title.toLowerCase()) {
      case 'fresh peach':
        return Colors.orangeAccent;
      case 'avocado':
        return const Color(0xFF6DC36E);
      case 'organic lemons':
        return const Color.fromARGB(255, 77, 184, 79);
      case 'apple':
        return Colors.redAccent;
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final bgColor = product.backgroundColor ?? _getCircleColor(product.name);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          DetailHeader(
            image: product.image,
            backgroundColor: bgColor,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailInfoSection(
                      nama: product.name,
                      harga: product.price,
                      deskripsi: product.description,
                      rating: product.rating,
                      ulasan: product.ulasan,
                    ),
                    const SizedBox(height: 25),
                    DetailQuantitySelector(
                      jumlah: jumlah,
                      onChanged: (val) => setState(() => jumlah = val),
                    ),
                    const SizedBox(height: 25),
                    AddToCartButton(
                      nama: product.name,
                      harga: product.price,
                      gambar: product.image,
                      jumlah: jumlah,
                      backgroundColor: bgColor,
                      onAdd: () {
                        cartProvider.addToCart(
                          product.name,
                          product.price,
                          jumlah,
                          product.image,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ShoppingCartPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
