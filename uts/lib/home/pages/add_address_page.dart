import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts/home/pages/checkout_page.dart';
import 'package:uts/home/pages/payment_method_page.dart';
import 'package:uts/theme/colors.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  bool _saveAddress = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: AppColors.textDark, size: 20),
          onPressed: () {
            {
            Navigator.push(context, 
              MaterialPageRoute(builder: (context) => const CheckOutPage())
            );
          }
          },
        ),
        title: Text(
          "Shipping Address",
          style: textTheme.titleLarge?.copyWith(
            color: AppColors.textDark,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 18,
                      left: 0,
                      right: 0,
                      child: Container(height: 2, color: AppColors.border),
                    ),
                    Positioned(
                      top: 18,
                      left: 0,
                      right: MediaQuery.of(context).size.width / 3,
                      child: Container(height: 2, color: AppColors.primaryDark),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStepCircle(1, "DELIVERY", completed: true),
                        _buildStepCircle(2, "ADDRESS", active: true),
                        _buildStepCircle(3, "PAYMENT"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      _buildTextField(Icons.person_outline, "Full Name"),
                      _buildTextField(Icons.email_outlined, "Email Address"),
                      _buildTextField(Icons.phone_outlined, "Phone Number"),
                      _buildTextField(Icons.location_on_outlined, "Full Address"),
                      _buildTextField(Icons.local_post_office_outlined, "Zip Code"),
                      _buildTextField(Icons.map_outlined, "City"),
                      _buildDropdownField(Icons.public, "Country"),
                      const SizedBox(height: 10),

                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.8,
                            child: Switch(
                              value: _saveAddress,
                              activeThumbColor: AppColors.primaryDark,
                              activeTrackColor: AppColors.primaryLight,
                              inactiveThumbColor: AppColors.border,
                              onChanged: (val) {
                                setState(() => _saveAddress = val);
                              },
                            ),
                          ),
                          Text(
                            "Save this address",
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColors.textDark,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 60), // space for button
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 5),
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PaymentMethodPage()),
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.primaryDark],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryDark.withValues(alpha: .3),
                          offset: const Offset(0, 5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Next",
                        style: textTheme.bodyLarge?.copyWith(
                          color: AppColors.background,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepCircle(int number, String label,
      {bool active = false, bool completed = false}) {
    Color color;
    Widget child;

    if (completed) {
      color = AppColors.primaryDark;
      child = const Icon(Icons.check, color: Colors.white, size: 16);
    } else if (active) {
      color = AppColors.primaryDark;
      child = Text(
        "$number",
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      );
    } else {
      color = AppColors.border;
      child = Text(
        "$number",
        style: const TextStyle(
            color: AppColors.textGrey, fontWeight: FontWeight.bold),
      );
    }

    return Column(
      children: [
        CircleAvatar(radius: 18, backgroundColor: color, child: child),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: active || completed
                ? AppColors.textDark
                : AppColors.textGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(IconData icon, String hint) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: AppColors.textGrey),
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.textGrey, fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildDropdownField(IconData icon, String hint) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: AppColors.textGrey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
        hint: Text(
          hint,
          style: const TextStyle(color: AppColors.textGrey, fontSize: 14),
        ),
        items: const [
          DropdownMenuItem(value: "Indonesia", child: Text("Indonesia")),
          DropdownMenuItem(value: "Singapore", child: Text("Singapore")),
          DropdownMenuItem(value: "Malaysia", child: Text("Malaysia")),
        ],
        onChanged: (_) {},
      ),
    );
  }
}
