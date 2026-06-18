import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailabilityCard extends StatefulWidget {
  const AvailabilityCard({super.key});

  @override
  State<AvailabilityCard> createState() => _AvailabilityCardState();
}

class _AvailabilityCardState extends State<AvailabilityCard> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.12),
        borderRadius: BorderRadius.circular(18.r),
      ),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "Availability Status",
                  style: TextStyle(color: Colors.white70, fontSize: 15.sp),
                ),

                SizedBox(height: 10.h),

                Row(
                  children: [
                    Container(
                      height: 9.h,
                      width: 9.w,

                      decoration: const BoxDecoration(
                        color: Color(0xff53F29D),
                        shape: BoxShape.circle,
                      ),
                    ),

                    SizedBox(width: 10.w),

                    Text(
                      "Available for Bookings",
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Switch(
            value: isAvailable,

            activeThumbColor: Colors.white,

            activeTrackColor: const Color(0xff7BE8B2),

            onChanged: (value) {
              setState(() {
                isAvailable = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
