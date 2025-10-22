import 'package:flutter/material.dart';
import 'package:uts/auth/login.dart';
import 'package:uts/home/pages/favorit/Favorite.dart';
import 'package:uts/home/pages/profile/menu/about_me.dart';
import 'package:uts/home/pages/profile/menu/my_address.dart';
import 'package:uts/home/pages/profile/menu/order_page.dart';
import 'package:uts/theme/colors.dart';

class ProfileMenuList extends StatelessWidget {
  const ProfileMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_ProfileItem> items = [
      _ProfileItem(Icons.person_outline, 'About me', () {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const AboutMePage()), (route) => false);
      }),
      _ProfileItem(Icons.shopping_bag_outlined, 'My Orders', () {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const MyOrderPage()), (route) => false);
      }),
      _ProfileItem(Icons.favorite_border, 'My Favorites', () {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const FavoritePage()), (route) => false);
      }),
      _ProfileItem(Icons.location_on_outlined, 'My Address', () {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const MyAddressPage()), (route) => false);
      }),
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
