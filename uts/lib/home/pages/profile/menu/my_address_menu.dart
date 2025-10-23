import 'package:flutter/material.dart';
import 'package:uts/home/pages/profile/menu/add_address_menu.dart';
import 'package:uts/home/pages/profile/profile.dart';
import 'package:uts/theme/colors.dart';

class MyAddressPage extends StatefulWidget {
  final Map<String, dynamic>? newAddress; // alamat baru dari AddAddressPage

  const MyAddressPage({super.key, this.newAddress});

  @override
  State<MyAddressPage> createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  bool _makeDefault = true;
  late List<Map<String, dynamic>> _addresses;

  @override
  void initState() {
    super.initState();

    _addresses = [
      {
        "name": "M. Imam Afwan",
        "address": "Los Santos\nUsa",
        "phone": "+1 202 555 0142",
        "isDefault": true,
        "expanded": false,
      },
      {
        "name": "Arhyk",
        "address": "Barcelona\nSpain",
        "phone": "+1 202 555 0142",
        "isDefault": false,
        "expanded": false,
      },
    ];

    // jika ada alamat baru dikirim dari AddAddressPage
    if (widget.newAddress != null) {
      final addr = {
        "name": widget.newAddress!["name"]?.toString() ?? "Unknown",
        "address": widget.newAddress!["address"]?.toString() ?? "Unknown",
        "phone": widget.newAddress!["phone"]?.toString() ?? "Unknown",
        "isDefault": widget.newAddress!["isDefault"] == true,
        "expanded": false,
      };
      _addresses.insert(0, addr);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text(
          "My Address",
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
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
              (route) => false,
            );
          },
        ),
        actions: [
          IconButton(
            icon:
                const Icon(Icons.add_circle_outline, color: AppColors.textDark),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddAddressPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            for (int i = 0; i < _addresses.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _buildAddressCard(
                  name: _addresses[i]["name"]?.toString() ?? "Unknown",
                  address: _addresses[i]["address"]?.toString() ?? "",
                  phone: _addresses[i]["phone"]?.toString() ?? "",
                  expanded: _addresses[i]["expanded"] == true,
                  isDefault: _addresses[i]["isDefault"] == true,
                  onExpandToggle: () {
                    setState(() {
                      _addresses[i]["expanded"] =
                          !(_addresses[i]["expanded"] == true);
                    });
                  },
                ),
              ),
            const SizedBox(height: 24),
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
                onPressed: () {},
                child: const Text(
                  "Save settings",
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

  Widget _buildAddressCard({
    required String name,
    required String address,
    required String phone,
    required bool expanded,
    required bool isDefault,
    required VoidCallback onExpandToggle,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.location_on_outlined,
                color: AppColors.primaryDark,
                size: 28,
              ),
            ),
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                ),
                if (isDefault)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "DEFAULT",
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
            subtitle: Text(
              "$address\n$phone",
              style: const TextStyle(
                fontSize: 13,
                height: 1.4,
                color: AppColors.textGrey,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                expanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: AppColors.primaryDark,
              ),
              onPressed: onExpandToggle,
            ),
          ),
          if (expanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: Column(
                children: [
                  _buildTextField(Icons.person_outline, "Name"),
                  const SizedBox(height: 10),
                  _buildTextField(Icons.home_outlined, "Address"),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(
                            Icons.location_city_outlined, "City"),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildTextField(
                            Icons.local_post_office_outlined, "Zip code"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildTextField(Icons.flag_outlined, "Country"),
                  const SizedBox(height: 10),
                  _buildTextField(Icons.phone_outlined, "Phone number"),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.75,
                        child: Switch(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeThumbColor: AppColors.primaryDark,
                          value: _makeDefault,
                          onChanged: (v) {
                            setState(() => _makeDefault = v);
                          },
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "Make default",
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.textGrey),
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textGrey),
        filled: true,
        fillColor: AppColors.backgroundLight,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
