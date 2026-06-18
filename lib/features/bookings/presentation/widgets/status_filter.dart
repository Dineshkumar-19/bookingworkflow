import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/booking_bloc.dart';
import '../../bloc/booking_event.dart';

class StatusFilter extends StatefulWidget {
  const StatusFilter({super.key});

  @override
  State<StatusFilter> createState() => _StatusFilterState();
}

class _StatusFilterState extends State<StatusFilter> {
  int selected = 0;

  final List<String> items = ["All", "Pending", "Confirmed", "Completed"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final isSelected = selected == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selected = index;
              });

              context.read<BookingBloc>().add(FilterBookings(items[index]));
            },
            child: Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xff5B2396) : Colors.white,
                borderRadius: BorderRadius.circular(25.r),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xff5B2396)
                      : Colors.grey.shade300,
                ),
              ),
              child: Center(
                child: Text(
                  items[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
