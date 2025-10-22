import 'package:flutter/material.dart';
import 'package:uts/theme/colors.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final TextEditingController _minController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();

  double _rating = 4.0;
  final Map<String, bool> _others = {
    'Discount': false,
    'Free shipping': true,
    'Same day delivery': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Apply Filters',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_outlined, color: Colors.black87),
            onPressed: () {
              setState(() {
                _minController.clear();
                _maxController.clear();
                _rating = 4.0;
                _others.updateAll((key, value) => false);
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPriceRange(),
            const SizedBox(height: 20),
            _buildStarRating(),
            const SizedBox(height: 20),
            _buildOthers(),
            const Spacer(),
            _buildApplyButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRange() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Price Range',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _priceInput(_minController, 'Min.'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _priceInput(_maxController, 'Max.'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _priceInput(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildStarRating() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Star Rating',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          Row(
            children: [
              Row(
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _rating.round()
                          ? Icons.star
                          : Icons.star_border,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      setState(() => _rating = (index + 1).toDouble());
                    },
                  );
                }),
              ),
              Text(
                "${_rating.toInt()} stars",
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOthers() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Others',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          ..._others.keys.map((key) {
            return ListTile(
              leading: Icon(
                key == 'Discount'
                    ? Icons.local_offer_outlined
                    : key == 'Free shipping'
                        ? Icons.local_shipping_outlined
                        : Icons.airplane_ticket_outlined,
                color: Colors.black54,
              ),
              title: Text(key),
              trailing: Icon(
                _others[key]!
                    ? Icons.check_circle_rounded
                    : Icons.radio_button_unchecked,
                color: _others[key]! ? AppColors.primary : Colors.grey[400],
              ),
              onTap: () {
                setState(() {
                  _others[key] = !_others[key]!;
                });
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildApplyButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primary, AppColors.primaryDark],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "Apply filter",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
