import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts/home/pages/order_succes_page.dart';
import 'package:uts/theme/colors.dart';

class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [
      _OrderStep(
        title: "Order Placed",
        date: "October 21 2021",
        iconData: Icons.inventory_2_outlined,
        status: _TrackStatus.completed,
      ),
      _OrderStep(
        title: "Order Confirmed",
        date: "October 21 2021",
        iconData: Icons.check_circle_outline,
        status: _TrackStatus.completed,
      ),
      _OrderStep(
        title: "Order Shipped",
        date: "October 21 2021",
        iconData: Icons.local_shipping_outlined,
        status: _TrackStatus.completed,
      ),
      _OrderStep(
        title: "Out for Delivery",
        date: "Pending",
        iconData: Icons.delivery_dining_outlined,
        status: _TrackStatus.pending,
      ),
      _OrderStep(
        title: "Order Delivered",
        date: "Pending",
        iconData: Icons.home_outlined,
        status: _TrackStatus.pending,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        title: Text(
          "Track Order",
          style: GoogleFonts.poppins(
            color: AppColors.textDark,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: AppColors.textDark, size: 18),
          onPressed: () {
            {
            Navigator.push(context, 
              MaterialPageRoute(builder: (context) => const OrderSuccessPage())
            );
          };
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.inventory_2_outlined,
                      color: AppColors.primaryDark,
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order #90897",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: AppColors.textDark,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Placed on October 19 2021",
                          style: GoogleFonts.poppins(
                            color: AppColors.textGrey,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              "Items: 10   ",
                              style: GoogleFonts.poppins(
                                color: AppColors.textGrey,
                                fontSize: 12.5,
                              ),
                            ),
                            Text(
                              "Items: \$16.90",
                              style: GoogleFonts.poppins(
                                color: AppColors.textDark,
                                fontSize: 12.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 26),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: List.generate(steps.length, (index) {
                  final step = steps[index];
                  final isLast = index == steps.length - 1;
                  final isFirst = index == 0;

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 56,
                        child: Column(
                          children: [
                            if (!isFirst)
                              Container(
                                height: 20,
                                width: 2,
                                color: step.status == _TrackStatus.completed
                                    ? AppColors.primaryLight
                                    : AppColors.border,
                              ),
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: step.status == _TrackStatus.completed
                                    ? AppColors.primaryLight
                                    : Colors.grey.shade100,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  step.iconData,
                                  color:
                                      step.status == _TrackStatus.completed
                                          ? AppColors.primaryDark
                                          : AppColors.textGrey,
                                  size: 22,
                                ),
                              ),
                            ),
                            if (!isLast)
                              Container(
                                height: 20,
                                width: 2,
                                color:
                                    _nextCompleted(steps, index)
                                        ? AppColors.primaryLight
                                        : AppColors.border,
                              ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                step.title,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textDark,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                step.date,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: AppColors.textGrey,
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _nextCompleted(List<_OrderStep> steps, int index) {
    if (index + 1 >= steps.length) return false;
    return steps[index + 1].status == _TrackStatus.completed;
  }
}

enum _TrackStatus { completed, pending }

class _OrderStep {
  final String title;
  final String date;
  final IconData iconData;
  final _TrackStatus status;

  _OrderStep({
    required this.title,
    required this.date,
    required this.iconData,
    required this.status,
  });
}
