import 'package:flutter/material.dart';
import 'package:uts/data/models/product_model.dart';
import 'package:uts/home/widget/detailPorduk/add_to_cart_button.dart';
import 'package:uts/home/widget/detailPorduk/detail_header.dart';
import 'package:uts/home/widget/detailPorduk/detail_info_section.dart';
import 'package:uts/home/widget/detailPorduk/detail_quantity_selector.dart';

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

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          DetailHeader(
            image: product.image,
            backgroundColor: product.backgroundColor,
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
                      backgroundColor: product.backgroundColor,
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
