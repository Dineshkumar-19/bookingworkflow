import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/booking_model.dart';
import 'booking_request_card.dart';

class RecentBookingSection extends StatelessWidget {
  final List<BookingModel> bookings;

  const RecentBookingSection({super.key, required this.bookings});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Recent Booking Requests",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                "View All",
                style: TextStyle(
                  color: const Color(0xff5B2396),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          SizedBox(height: 18.h),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final booking = bookings[index];

              return BookingRequestCard(
                initials: booking.customerName
                    .split(" ")
                    .map((e) => e[0])
                    .take(2)
                    .join(),

                customerName: booking.customerName,

                ritual: booking.ritualName,

                date: "${booking.date} • ${booking.time}",

                amount: "₹${booking.amount.toInt()}",

                status: booking.status,

                statusColor: booking.status == "Pending"
                    ? Colors.orange
                    : booking.status == "Completed"
                    ? Colors.green
                    : Colors.blue,
              );
            },
          ),
        ],
      ),
    );
  }
}
