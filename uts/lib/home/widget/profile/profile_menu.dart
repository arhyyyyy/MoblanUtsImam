import 'package:flutter/material.dart';
import 'package:uts/auth/login.dart';
import 'package:uts/theme/colors.dart';

class ProfileMenuList extends StatelessWidget {
  const ProfileMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_ProfileItem> items = [
      _ProfileItem(Icons.person_outline, 'About me', () {}),
      _ProfileItem(Icons.shopping_bag_outlined, 'My Orders', () {}),
      _ProfileItem(Icons.favorite_border, 'My Favorites', () {}),
      _ProfileItem(Icons.location_on_outlined, 'My Address', () {}),
      _ProfileItem(Icons.credit_card_outlined, 'Credit Cards', () {}),
      _ProfileItem(Icons.swap_horiz_outlined, 'Transactions', () {}),
      _ProfileItem(Icons.notifications_none_outlined, 'Notifications', () {}),
      _ProfileItem(Icons.logout, 'Sign out', () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
          (route) => false,
        );
      }),
    ];

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(
              height: 0,
              thickness: 0.2,
              indent: 60,
              endIndent: 20,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                onTap: item.onTap,
                leading: Icon(item.icon, color: AppColors.primary, size: 24),
                title: Text(
                  item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ProfileItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  _ProfileItem(this.icon, this.title, this.onTap);
}
