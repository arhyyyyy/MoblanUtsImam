import 'package:flutter/material.dart';
import 'package:uts/cart/pages/shopping_cart_page.dart';
import 'package:uts/home/pages/favorit/Favorite.dart';
import 'package:uts/home/pages/home.page.dart';
import 'package:uts/home/pages/profile/profile.dart';

class FloatingCartButton extends StatefulWidget {
  const FloatingCartButton({super.key});

  @override
  State<FloatingCartButton> createState() => _FloatingCartButtonState();
}

class _FloatingCartButtonState extends State<FloatingCartButton> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    ProfilePage(),
    FavoritePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFF4CAF50),
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(),
                label: '',
              ),
            ],
          ),
        ),

        // Floating cart button
        Positioned(
          bottom: 35,
          right: 30,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ShoppingCartPage()),
              );
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: Color(0xFF4CAF50),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
