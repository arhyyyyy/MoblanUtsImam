import 'package:flutter/material.dart';

class DetailQuantitySelector extends StatelessWidget {
  final int jumlah;
  final ValueChanged<int> onChanged;

  const DetailQuantitySelector({
    super.key,
    required this.jumlah,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Quantity",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade100,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  if (jumlah > 1) onChanged(jumlah - 1);
                },
                icon: const Icon(Icons.remove),
              ),
              Text('$jumlah', style: const TextStyle(fontSize: 16)),
              IconButton(
                onPressed: () => onChanged(jumlah + 1),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
