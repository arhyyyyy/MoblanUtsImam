import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts/home/pages/order_succes_page.dart';
import 'package:uts/theme/colors.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  bool saveCard = true;
  int selectedMethod = 1;

  Widget _buildStep(String title, bool active) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: active ? AppColors.primaryDark : Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Icon(
            active ? Icons.check : Icons.circle_outlined,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: active ? AppColors.textDark : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentOption(String label, IconData icon, int index) {
    final isSelected = selectedMethod == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedMethod = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? AppColors.primaryDark : AppColors.border,
              width: 1.4,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color:
                    isSelected ? AppColors.primaryDark : AppColors.textGrey,
                size: 26,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  color:
                      isSelected ? AppColors.primaryDark : AppColors.textGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint,
      {bool half = false, bool secure = false}) {
    return Expanded(
      flex: half ? 1 : 0,
      child: Container(
        margin: EdgeInsets.only(bottom: 12, right: half ? 6 : 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: TextField(
          obscureText: secure,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: AppColors.textGrey, size: 20),
            hintText: hint,
            hintStyle: GoogleFonts.poppins(fontSize: 13.5),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Payment Method',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              size: 18, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 16,
                  left: 30,
                  right: 30,
                  child: Container(height: 2, color: Colors.grey[300]),
                ),
                Positioned(
                  top: 16,
                  left: 30,
                  right: 30,
                  child: Container(height: 2, color: AppColors.primaryDark),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStep('DELIVERY', true),
                    _buildStep('ADDRESS', true),
                    _buildStep('PAYMENT', true),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPaymentOption('Paypal', Icons.paypal, 0),
                const SizedBox(width: 10),
                _buildPaymentOption('Credit Card', Icons.credit_card, 1),
                const SizedBox(width: 10),
                _buildPaymentOption('Apple Pay', Icons.apple, 2),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 170,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 15,
                    left: 0,
                    child: Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 28,
                          height: 28,
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                        'XXXX  XXXX  XXXX  8790',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 19,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'RUSSELL AUSTIN',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '01 / 22',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            _buildTextField(Icons.person_outline, 'Name on the card'),
            _buildTextField(Icons.credit_card_outlined, 'Card number'),
            Row(
              children: [
                _buildTextField(Icons.calendar_month, 'Month / Year', half: true),
                _buildTextField(Icons.lock_outline, 'CVV', half: true),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Save this card",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    value: saveCard,
                    onChanged: (v) => setState(() => saveCard = v),
                    activeTrackColor: AppColors.primaryDark,
                    inactiveTrackColor: AppColors.border,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 75),
            Container(
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => const OrderSuccessPage())
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                child: const Text(
                  "Make a payment",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
