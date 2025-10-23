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
    final String name = item["name"]?.toString() ?? "Unknown";
    final String weight = item["weight"]?.toString() ?? "-";
    final String imagePath = item["image"]?.toString() ?? "";
    final double price = (item["price"] is num)
        ? (item["price"] as num).toDouble()
        : double.tryParse(item["price"]?.toString() ?? "0") ?? 0.0;
    final int quantity = item["quantity"] is int
        ? item["quantity"] as int
        : int.tryParse(item["quantity"]?.toString() ?? "1") ?? 1;
    final Color circleColor = item["circleColor"] is Color
        ? item["circleColor"]
        : Colors.green.shade50;

    return Dismissible(
      key: ValueKey(name),
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
                color: circleColor,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: imagePath.isNotEmpty
                    ? Image.asset(imagePath)
                    : const Icon(Icons.image_not_supported),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87)),
                  const SizedBox(height: 3),
                  Text(weight,
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 6),
                  Text("\$${price.toStringAsFixed(2)}",
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
                Text("$quantity",
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
