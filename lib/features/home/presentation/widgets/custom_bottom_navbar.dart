import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_router.gr.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavbar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h, bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.black.withOpacity(0.05), width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.03),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _item(context, icon: Icons.home_rounded, label: "Home", index: 0),
            _item(
              context,
              icon: Icons.calendar_month,
              label: "Bookings",
              index: 1,
            ),
            _item(
              context,
              icon: Icons.account_balance_wallet_outlined,
              label: "Earnings",
              index: 2,
            ),
            _item(
              context,
              icon: Icons.person_outline,
              label: "Profile",
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = selectedIndex == index;
    final activeColor = const Color(0xff5B2396);
    final inactiveColor = Colors.grey;

    return Expanded(
      child: InkWell(
        onTap: () {
          if (isSelected) return;

          switch (index) {
            case 0:
              context.replaceRoute(const HomeRoute());
              break;

            case 1:
              context.replaceRoute(const BookingRoute());
              break;

            // case 2:
            //   context.replaceRoute(const EarningsRoute());
            //   break;

            // case 3:
            //   context.replaceRoute(const ProfileRoute());
            //   break;
          }
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? activeColor : inactiveColor,
              size: 24.sp,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? activeColor : inactiveColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
