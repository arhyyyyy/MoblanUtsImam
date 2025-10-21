import 'package:flutter/material.dart';
import 'package:uts/cart/pages/shopping_cart_page.dart';
import 'package:uts/data/models/product_model.dart';
import 'package:uts/home/widget/detailPorduk/add_to_cart_button.dart';
import 'package:uts/home/widget/detailPorduk/detail_header.dart';
import 'package:uts/home/widget/detailPorduk/detail_info_section.dart';
import 'package:uts/home/widget/detailPorduk/detail_quantity_selector.dart';
import '../../theme/colors.dart';

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
                    // Tombol Add to Cart
                    AddToCartButton(
                      nama: product.name,
                      harga: product.price,
                      gambar: product.image,
                      jumlah: jumlah,
                      backgroundColor: bgColor,
                      onAdd: () {
                        final cartItem = {
                          "id": product.id,
                          "name": product.name,
                          "weight": product.unit,
                          "price": double.tryParse(
                                  product.price.replaceAll("\$", "")) ??
                              0,
                          "image": product.image,
                          "circleColor": bgColor,
                          "quantity": jumlah,
                        };

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ShoppingCartPage(cartItems: [cartItem]),
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