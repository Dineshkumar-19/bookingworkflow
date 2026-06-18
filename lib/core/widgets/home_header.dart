import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'availability_card.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 18.h,
        bottom: 22.h,
      ),

      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff4D148C), Color(0xff6A1B9A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),

      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "🙏 Namaste,",
                      style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      "Pandit Iyer",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 34.sp,
                      ),
                    ),
                  ],
                ),
              ),

              _squareButton(Icons.notifications_none, const Color(0xff7440B6)),

              SizedBox(width: 12.w),

              Container(
                height: 48.h,
                width: 48.w,

                decoration: BoxDecoration(
                  color: const Color(0xffF8C116),
                  borderRadius: BorderRadius.circular(14.r),
                ),

                alignment: Alignment.center,

                child: Text(
                  "PI",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 22.h),

          const AvailabilityCard(),
        ],
      ),
    );
  }

  Widget _squareButton(IconData icon, Color color) {
    return Container(
      height: 48.h,
      width: 48.w,

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14.r),
      ),

      child: Icon(icon, color: const Color(0xffFFC107), size: 26.sp),
    );
  }
}
