import 'package:flutter/material.dart';
import 'package:uts/home/pages/profile/menu/add_card_menu.dart';
import 'package:uts/home/pages/profile/profile.dart';
import 'package:uts/theme/colors.dart';
import 'package:uts/theme/theme.dart';

class MyCardsPage extends StatefulWidget {
  const MyCardsPage({super.key});

  @override
  State<MyCardsPage> createState() => _MyCardsPageState();
}

class _MyCardsPageState extends State<MyCardsPage> {
  int defaultCardIndex = 0;
  final List<Map<String, dynamic>> cards = [
    {
      "type": "Master Card",
      "logo": "images/mastercard.png",
      "number": "XXXX XXXX XXXX 5678",
      "expiry": "01/22",
      "cvv": "908",
    },
    {
      "type": "Visa Card",
      "logo": "images/visa.png",
      "number": "XXXX XXXX XXXX 5678",
      "expiry": "01/22",
      "cvv": "908",
    },
    {
      "type": "Master Card",
      "logo": "images/mastercard.png",
      "number": "XXXX XXXX XXXX 5678",
      "expiry": "01/22",
      "cvv": "908",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text("My Cards"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: (){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 26),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddCreditCardPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            for (int i = 0; i < cards.length; i++) ...[
              _buildCardItem(
                context,
                index: i,
                isDefault: i == defaultCardIndex,
                cardType: cards[i]["type"],
                cardLogo: cards[i]["logo"],
                cardNumber: cards[i]["number"],
                expiry: cards[i]["expiry"],
                cvv: cards[i]["cvv"],
              ),
              const SizedBox(height: 16),
            ],
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 52),
                elevation: 0,
              ),
              child: Text(
                "Save settings",
                style: textTheme.bodyLarge!.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardItem(
    BuildContext context, {
    required int index,
    required bool isDefault,
    required String cardType,
    required String cardLogo,
    required String cardNumber,
    required String expiry,
    required String cvv,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDefault)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Text(
                "DEFAULT",
                style: textTheme.labelLarge!.copyWith(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            leading: Image.asset(cardLogo, height: 30),
            title: Text(cardType, style: textTheme.bodyLarge),
            subtitle: Text(
              "$cardNumber\nExpiry: $expiry   CVV: $cvv",
              style: textTheme.labelLarge!.copyWith(color: AppColors.textGrey),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.primaryDark,
              size: 22,
            ),
          ),
          if (isDefault)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Column(
                children: [
                  _disabledTextField(Icons.person, "Arhy"),
                  const SizedBox(height: 8),
                  _disabledTextField(Icons.credit_card, cardNumber),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                          child: _disabledTextField(Icons.date_range, expiry)),
                      const SizedBox(width: 8),
                      Expanded(child: _disabledTextField(Icons.lock, cvv)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Make default", style: textTheme.bodyMedium),
                      Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          activeThumbColor: AppColors.primaryDark,
                          value: isDefault,
                          onChanged: (val) {
                            if (val) {
                              setState(() => defaultCardIndex = index);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _disabledTextField(IconData icon, String hint) {
    return TextField(
      enabled: false,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.textGrey, size: 20),
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textGrey),
        filled: true,
        fillColor: AppColors.backgroundAlt,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
