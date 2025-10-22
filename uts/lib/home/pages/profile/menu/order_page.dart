import 'package:flutter/material.dart';
import 'package:uts/home/pages/profile/profile.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  // Simulasi data pesanan
  final List<bool> _isExpanded = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text(
          "My Order",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const ProfilePage()), (route) => false);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.tune, color: Colors.black),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        itemBuilder: (context, index) {
          return _buildOrderCard(index);
        },
      ),
    );
  }

  Widget _buildOrderCard(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFFEFF9EC),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.inventory_2_outlined,
                  color: Color(0xFF7EE55B), size: 28),
            ),
            title: const Text(
              "Order #90897",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: const Text(
              "Placed on October 19 2021\nItems: 10    Items: \$16.90",
              style: TextStyle(fontSize: 13, height: 1.4),
            ),
            trailing: IconButton(
              icon: Icon(
                _isExpanded[index]
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: const Color(0xFF7EE55B),
              ),
              onPressed: () {
                setState(() {
                  _isExpanded[index] = !_isExpanded[index];
                });
              },
            ),
          ),
          if (_isExpanded[index]) _buildOrderStatus(),
        ],
      ),
    );
  }

  Widget _buildOrderStatus() {
    final steps = [
      {"title": "Order placed", "date": "Oct 19 2021", "active": true},
      {"title": "Order confirmed", "date": "Oct 20 2021", "active": true},
      {"title": "Order shipped", "date": "Oct 20 2021", "active": true},
      {"title": "Out for delivery", "date": "pending", "active": false},
      {"title": "Order delivered", "date": "pending", "active": false},
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: Column(
        children: [
          const Divider(height: 1),
          const SizedBox(height: 16),
          Column(
            children: List.generate(
              steps.length,
              (i) => _buildTimelineRow(
                steps[i]["title"] as String,
                steps[i]["date"] as String,
                active: steps[i]["active"] as bool,
                isLast: i == steps.length - 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineRow(String title, String date,
      {required bool active, required bool isLast}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator + line
        Column(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: active ? const Color(0xFF7EE55B) : Colors.grey[300],
                shape: BoxShape.circle,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 30,
                color: active ? const Color(0xFF7EE55B) : Colors.grey[300],
              ),
          ],
        ),
        const SizedBox(width: 12),
        // Text info
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight:
                        active ? FontWeight.w600 : FontWeight.normal,
                    color: active ? Colors.black : Colors.grey,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 13,
                    color: active ? Colors.black87 : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
