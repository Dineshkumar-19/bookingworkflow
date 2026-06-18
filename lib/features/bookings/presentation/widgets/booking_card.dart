import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingCard extends StatelessWidget {
  final String initials;
  final String customerName;
  final String bookingId;
  final String ritualName;
  final String duration;
  final String dateTime;
  final String amount;
  final String status;

  const BookingCard({
    super.key,
    required this.initials,
    required this.customerName,
    required this.bookingId,
    required this.ritualName,
    required this.duration,
    required this.dateTime,
    required this.amount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),

      padding: EdgeInsets.all(16.w),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAvatar(),

          SizedBox(width: 14.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            customerName,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 2.h),

                          Text(
                            bookingId,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          amount,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: Colors.black87,
                          ),
                        ),

                        SizedBox(height: 6.h),

                        _statusChip(),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                Row(
                  children: [
                    const Icon(
                      Icons.local_fire_department,
                      size: 15,
                      color: Colors.orange,
                    ),

                    SizedBox(width: 6.w),

                    Expanded(
                      child: Text(
                        "$ritualName • $duration",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8.h),

                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 15,
                      color: Colors.grey,
                    ),

                    SizedBox(width: 6.w),

                    Text(
                      dateTime,
                      style: TextStyle(fontSize: 13.sp, color: Colors.grey),
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

  Widget _buildAvatar() {
    return Container(
      width: 52.w,
      height: 52.w,

      decoration: BoxDecoration(
        color: _avatarColor(),
        borderRadius: BorderRadius.circular(12.r),
      ),

      alignment: Alignment.center,

      child: Text(
        initials,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
      ),
    );
  }

  Widget _statusChip() {
    Color color;

    switch (status) {
      case "Pending":
        color = Colors.orange;
        break;

      case "Confirmed":
        color = Colors.green;
        break;

      case "Completed":
        color = Colors.blue;
        break;

      case "Cancelled":
        color = Colors.red;
        break;

      default:
        color = Colors.grey;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),

      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(20.r),
      ),

      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 11.sp,
        ),
      ),
    );
  }

  Color _avatarColor() {
    switch (status) {
      case "Pending":
        return const Color(0xff5B2396);

      case "Confirmed":
        return Colors.orange;

      case "Completed":
        return Colors.teal;

      case "Cancelled":
        return Colors.brown;

      default:
        return Colors.grey;
    }
  }
}
