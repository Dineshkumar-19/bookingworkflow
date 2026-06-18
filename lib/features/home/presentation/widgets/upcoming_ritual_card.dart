import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingRitualCard extends StatelessWidget {
  const UpcomingRitualCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Upcoming Muhurtha",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 14.h),

          Container(
            width: double.infinity,

            padding: EdgeInsets.all(18.w),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.r),

              gradient: const LinearGradient(
                colors: [Color(0xff5B2396), Color(0xff6E35B3)],
              ),
            ),

            child: Stack(
              children: [
                Positioned(
                  right: -30,
                  top: -20,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white.withOpacity(.08),
                  ),
                ),

                Positioned(
                  left: -20,
                  bottom: -35,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white.withOpacity(.05),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.w),

                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.15),
                            borderRadius: BorderRadius.circular(12.r),
                          ),

                          child: const Icon(
                            Icons.auto_awesome,
                            color: Colors.amber,
                          ),
                        ),

                        SizedBox(width: 12.w),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                "Ganesh Homam",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 3.h),

                              Text(
                                "Rajesh Kumar",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 22.h),

                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.white70,
                          size: 17,
                        ),

                        SizedBox(width: 8.w),

                        Text(
                          "08 Jun 2026",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),

                        SizedBox(width: 20.w),

                        const Icon(
                          Icons.access_time,
                          color: Colors.white70,
                          size: 17,
                        ),

                        SizedBox(width: 8.w),

                        Text(
                          "10:00 AM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 18.h),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 8.h,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20.r),
                      ),

                      child: Text(
                        "Starts in 2 Hours",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
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
}
