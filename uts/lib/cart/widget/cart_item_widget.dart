import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onIncrement, onDecrement, onRemove;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.delete_outline_outlined, color: Colors.white),
      ),
      onDismissed: (_) => onRemove(),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: item["circleColor"],
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(item["image"]),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item["name"],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87)),
                  const SizedBox(height: 3),
                  Text(item["weight"],
                      style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 6),
                  Text("\$${item["price"].toStringAsFixed(2)}",
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                    onPressed: onIncrement,
                    icon: const Icon(Icons.add, color: Colors.green)),
                Text("${item["quantity"]}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                IconButton(
                    onPressed: onDecrement,
                    icon: const Icon(Icons.remove, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
