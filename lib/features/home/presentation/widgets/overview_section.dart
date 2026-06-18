import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/booking_model.dart';
import 'stat_card.dart';

class OverviewSection extends StatelessWidget {
  final List<BookingModel> bookings;

  const OverviewSection({super.key, required this.bookings});

  @override
  Widget build(BuildContext context) {
    final totalBookings = bookings.length;

    final pendingBookings = bookings.where((e) => e.status == "Pending").length;

    final completedBookings = bookings
        .where((e) => e.status == "Completed")
        .length;

    final earnings = bookings.fold<double>(0, (sum, item) => sum + item.amount);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),

      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Today's Overview",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),

              const Spacer(),

              Text(
                "View All",
                style: TextStyle(
                  color: const Color(0xff5B2396),
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),

          SizedBox(height: 18.h),

          GridView.count(
            shrinkWrap: true,

            physics: const NeverScrollableScrollPhysics(),

            crossAxisCount: 2,

            mainAxisSpacing: 14.h,

            crossAxisSpacing: 14.w,

            childAspectRatio: 1.25,

            children: [
              StatCard(
                title: "TOTAL BOOKINGS",
                value: totalBookings.toString(),
                subtitle: "Bookings",
                color: const Color(0xff6C63FF),
                icon: Icons.calendar_month,
              ),

              StatCard(
                title: "PENDING",
                value: pendingBookings.toString(),
                subtitle: "Pending",
                color: const Color(0xffF5B335),
                icon: Icons.pending_actions,
              ),

              StatCard(
                title: "COMPLETED",
                value: completedBookings.toString(),
                subtitle: "Completed",
                color: const Color(0xff2BC48A),
                icon: Icons.check_circle,
              ),

              StatCard(
                title: "EARNINGS",
                value: "₹${earnings.toInt()}",
                subtitle: "Revenue",
                color: const Color(0xffF05B52),
                icon: Icons.account_balance_wallet,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
