import 'package:flutter/material.dart';
import 'package:uts/home/pages/profile/profile.dart';
import 'package:uts/theme/colors.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final transactions = [
      {
        'image': 'images/mastercard.png',
        'title': 'Master Card',
        'date': 'Dec 12 2021 at 10:00 pm',
        'amount': '\$89'
      },
      {
        'image': 'images/visa.png',
        'title': 'Master Card',
        'date': 'Dec 12 2021 at 10:00 pm',
        'amount': '\$109'
      },
      {
        'image': 'images/paypal.png',
        'title': 'Paypal',
        'date': 'Dec 12 2021 at 10:00 pm',
        'amount': '\$567'
      },
      {
        'image': 'images/paypal.png',
        'title': 'Paypal',
        'date': 'Dec 12 2021 at 10:00 pm',
        'amount': '\$567'
      },
      {
        'image': 'images/visa.png',
        'title': 'Master Card',
        'date': 'Dec 12 2021 at 10:00 pm',
        'amount': '\$109'
      },
      {
        'image': 'images/mastercard.png',
        'title': 'Master Card',
        'date': 'Dec 12 2021 at 10:00 pm',
        'amount': '\$89'
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: (){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
        ),
        title: Text(
          "Transactions",
          style: textTheme.titleLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: transactions.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = transactions[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Image.asset(
                  item['image']!,
                  width: 46,
                  height: 46,
                  fit: BoxFit.contain,
                ),

                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item['date']!,
                        style: textTheme.bodySmall!.copyWith(
                          color: Colors.grey[600],
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  item['amount']!,
                  style: textTheme.titleMedium!.copyWith(
                    color: Colors.green[600],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
