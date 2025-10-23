import 'package:flutter/material.dart';
import 'package:uts/home/pages/add_address_page.dart';
import 'package:uts/theme/colors.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> checkout = [
    {
      "title": "Standard Delivery",
      "description":
          "Order will be delivered between 3 - 4 business days straight to your doorstep.",
      "price": "\$3"
    },
    {
      "title": "Next Day Delivery",
      "description":
          "Order will be delivered the next day straight to your doorstep.",
      "price": "\$5"
    },
    {
      "title": "Nominated Delivery",
      "description":
          "Order will be delivered on the nominated date straight to your doorstep.",
      "price": "\$3"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text(
          "Shipping Method",
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: AppColors.textDark, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [

              SizedBox(
                height: 70,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 18,
                      left: 0,
                      right: 0,
                      child: Container(height: 2, color: AppColors.border),
                    ),
                    Positioned(
                      top: 18,
                      left: 0,
                      right: MediaQuery.of(context).size.width * 0.33,
                      child: Container(height: 2, color: AppColors.primaryDark),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStepCircle(1, "DELIVERY", active: true),
                        _buildStepCircle(2, "ADDRESS", active: false),
                        _buildStepCircle(3, "PAYMENT", active: false),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: checkout.length,
                  itemBuilder: (context, index) {
                    final method = checkout[index];
                    final isSelected = selectedIndex == index;

                    return GestureDetector(
                      onTap: () => setState(() => selectedIndex = index),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primaryDark
                                : Colors.transparent,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.textGrey.withValues(alpha: 0.05),
                              blurRadius: 3,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    method['title'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    method['description'],
                                    style: const TextStyle(
                                      color: AppColors.textGrey,
                                      fontSize: 13,
                                      height: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Price
                            Text(
                              method['price'],
                              style: const TextStyle(
                                color: AppColors.primaryDark,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddAddressPage()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.primaryDark],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryDark.withValues(alpha: .3),
                          offset: const Offset(0, 5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: AppColors.background,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepCircle(int number, String label, {bool active = true}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: active ? AppColors.primaryDark : AppColors.border,
          child: Text(
            "$number",
            style: TextStyle(
              color: active ? AppColors.background : AppColors.textGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: active ? AppColors.textDark : AppColors.textGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
