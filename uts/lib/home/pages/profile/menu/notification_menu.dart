import 'package:flutter/material.dart';
import 'package:uts/home/pages/profile/profile.dart';
import 'package:uts/theme/colors.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool allowNotif = true;
  bool emailNotif = false;
  bool orderNotif = false;
  bool generalNotif = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundAlt,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const ProfilePage()),
            )
          },
        ),
        title: Text(
          "Notifications",
          style: textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          children: [
            _buildNotificationTile(
              title: "Allow Notifications",
              description:
                  "Lorem ipsum dolor sit amet, consectetur sadi psicing elitr, sed diam nonumym",
              value: allowNotif,
              onChanged: (v) => setState(() => allowNotif = v),
            ),
            const SizedBox(height: 12),
            _buildNotificationTile(
              title: "Email Notifications",
              description:
                  "Lorem ipsum dolor sit amet, consectetur sadi psicing elitr, sed diam nonumym",
              value: emailNotif,
              onChanged: (v) => setState(() => emailNotif = v),
            ),
            const SizedBox(height: 12),
            _buildNotificationTile(
              title: "Order Notifications",
              description:
                  "Lorem ipsum dolor sit amet, consectetur sadi psicing elitr, sed diam nonumym",
              value: orderNotif,
              onChanged: (v) => setState(() => orderNotif = v),
            ),
            const SizedBox(height: 12),
            _buildNotificationTile(
              title: "General Notifications",
              description:
                  "Lorem ipsum dolor sit amet, consectetur sadi psicing elitr, sed diam nonumym",
              value: generalNotif,
              onChanged: (v) => setState(() => generalNotif = v),
            ),
            const SizedBox(height: 330),
            Container(
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Settings saved successfully!",
                        style: textTheme.bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                      backgroundColor: AppColors.primaryDark,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Save settings",
                  style: textTheme.bodyLarge!.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationTile({
    required String title,
    required String description,
    required bool value,
    required Function(bool) onChanged,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: textTheme.bodySmall!.copyWith(
                    color: AppColors.textGrey,
                    height: 1.3,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Transform.scale(
            scale: 0.8,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: Colors.white,
              activeTrackColor: AppColors.primaryDark,
              inactiveTrackColor: Colors.grey.shade300,
              inactiveThumbColor: Colors.white,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}
