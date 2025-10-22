import 'package:flutter/material.dart';
import 'package:uts/home/pages/profile/menu/my_address.dart';
import 'package:uts/theme/colors.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  bool _saveAddress = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text(
          "Add Address",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTextField(Icons.person_outline, "Name", _nameController),
            const SizedBox(height: 10),
            _buildTextField(Icons.email_outlined, "Email address", _emailController),
            const SizedBox(height: 10),
            _buildTextField(Icons.phone_outlined, "Phone number", _phoneController),
            const SizedBox(height: 10),
            _buildTextField(Icons.home_outlined, "Address", _addressController),
            const SizedBox(height: 10),
            _buildTextField(Icons.local_post_office_outlined, "Zip code", _zipController),
            const SizedBox(height: 10),
            _buildTextField(Icons.location_city_outlined, "City", _cityController),
            const SizedBox(height: 10),
            _buildTextField(Icons.public_outlined, "Country", _countryController),
            const SizedBox(height: 14),
            Row(
              children: [
                Transform.scale(
                  scale: 0.75,
                  child: Switch(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeThumbColor: AppColors.primaryDark,
                    value: _saveAddress,
                    onChanged: (v) => setState(() => _saveAddress = v),
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  "Save this address",
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (_validateInputs()) {
                    // Buat map data alamat
                    final newAddress = {
                      'name': _nameController.text,
                      'address': _addressController.text,
                      'phone': _phoneController.text,
                      'country': _countryController.text,
                      'city': _cityController.text,
                      'zip': _zipController.text,
                    };

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyAddressPage(newAddress: newAddress),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill in all fields."),
                        backgroundColor: AppColors.primaryDark,
                      ),
                    );
                  }
                },
                child: const Text(
                  "Add address",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.background,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateInputs() {
    return _nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _zipController.text.isNotEmpty &&
        _cityController.text.isNotEmpty &&
        _countryController.text.isNotEmpty;
  }

  Widget _buildTextField(IconData icon, String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.textGrey),
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textGrey),
        filled: true,
        fillColor: AppColors.background,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
