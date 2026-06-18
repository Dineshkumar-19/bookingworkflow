import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color color;
  final IconData icon;

  const StatCard({
    super.key,

    required this.title,

    required this.value,

    required this.subtitle,

    required this.color,

    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),

      decoration: BoxDecoration(
        color: color,

        borderRadius: BorderRadius.circular(18.r),
      ),

      child: Stack(
        children: [
          Positioned(
            right: -12,

            top: -12,

            child: CircleAvatar(
              radius: 35,

              backgroundColor: Colors.white.withOpacity(.08),
            ),
          ),

          Positioned(
            bottom: -25,

            left: -25,

            child: CircleAvatar(
              radius: 40,

              backgroundColor: Colors.black.withOpacity(.04),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,

                      style: TextStyle(
                        color: Colors.white70,

                        fontSize: 10.sp,

                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  Container(
                    height: 34.h,

                    width: 34.w,

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.18),

                      borderRadius: BorderRadius.circular(10.r),
                    ),

                    child: Icon(icon, color: Colors.white, size: 18.sp),
                  ),
                ],
              ),

              const Spacer(),

              Text(
                value,

                style: TextStyle(
                  color: Colors.white,

                  fontSize: 30.sp,

                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 6.h),

              Text(
                subtitle,

                style: TextStyle(color: Colors.white70, fontSize: 12.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
