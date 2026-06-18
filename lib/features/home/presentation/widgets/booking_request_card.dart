import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingRequestCard extends StatelessWidget {
  final String initials;
  final String customerName;
  final String ritual;
  final String date;
  final String amount;
  final String status;
  final Color statusColor;

  const BookingRequestCard({
    super.key,
    required this.initials,
    required this.customerName,
    required this.ritual,
    required this.date,
    required this.amount,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),

      padding: EdgeInsets.all(16.w),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(22.r),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.r,

                backgroundColor: const Color(0xff5B2396),

                child: Text(
                  initials,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),

              SizedBox(width: 14.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      customerName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),

                    SizedBox(height: 5.h),

                    Text(
                      ritual,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                amount,
                style: TextStyle(
                  color: const Color(0xff5B2396),
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                ),
              ),
            ],
          ),

          SizedBox(height: 15.h),

          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16, color: Colors.grey),

              SizedBox(width: 8.w),

              Text(
                date,
                style: TextStyle(color: Colors.grey, fontSize: 13.sp),
              ),

              const Spacer(),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),

                decoration: BoxDecoration(
                  color: statusColor.withOpacity(.15),
                  borderRadius: BorderRadius.circular(25.r),
                ),

                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
