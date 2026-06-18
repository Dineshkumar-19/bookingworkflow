import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/app_router.gr.dart';
import '../../../data/repository/booking_repository.dart';
import '../../home/presentation/widgets/custom_bottom_navbar.dart';
import '../bloc/booking_bloc.dart';
import '../bloc/booking_event.dart';
import '../bloc/booking_state.dart';
import 'widgets/booking_card.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/status_filter.dart';

@RoutePage()
class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingBloc(BookingRepository())..add(LoadBookings()),
      child: Scaffold(
        backgroundColor: const Color(0xffF4F4F6),
        body: BlocBuilder<BookingBloc, BookingState>(
          builder: (context, state) {
            if (state is BookingLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is BookingLoaded) {
              final total = state.bookings.length;

              final pending = state.bookings
                  .where((e) => e.status == "Pending")
                  .length;

              final completed = state.bookings
                  .where((e) => e.status == "Completed")
                  .length;

              final cancelled = state.bookings
                  .where((e) => e.status == "Cancelled")
                  .length;

              return Column(
                children: [
                  _buildHeader(
                    total: total,
                    pending: pending,
                    completed: completed,
                    cancelled: cancelled,
                  ),

                  SizedBox(height: 45.h),

                  Expanded(
                    child: SafeArea(
                      top: false,
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: const StatusFilter(),
                          ),

                          SizedBox(height: 20.h),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: const SearchBarWidget(),
                          ),

                          Expanded(
                            child: ListView.builder(
                              itemCount: state.bookings.length,
                              itemBuilder: (context, index) {
                                final booking = state.bookings[index];

                                final initials = booking.customerName
                                    .split(" ")
                                    .map((e) => e[0])
                                    .take(2)
                                    .join();

                                return GestureDetector(
                                  onTap: () {
                                    context.pushRoute(
                                      BookingDetailsRoute(booking: booking),
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                    ),
                                    child: BookingCard(
                                      initials: initials,
                                      customerName: booking.customerName,
                                      bookingId: "BK00${booking.id}",
                                      ritualName: booking.ritualName,
                                      duration: "2-3 Hrs",
                                      dateTime:
                                          "${booking.date} • ${booking.time}",
                                      amount:
                                          "₹${booking.amount.toStringAsFixed(0)}",
                                      status: booking.status,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
        bottomNavigationBar: const CustomBottomNavbar(selectedIndex: 1),
      ),
    );
  }
}

Widget _buildHeader({
  required int total,
  required int pending,
  required int completed,
  required int cancelled,
}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      // Purple Header
      Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 50.h,
          bottom: 70.h, // leave space for floating card
        ),
        decoration: const BoxDecoration(
          color: Color(0xff5B2396),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(28),
            bottomRight: Radius.circular(28),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  " * Booking Registry",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                _headerIcon(Icons.search),

                SizedBox(width: 10.w),

                _notificationIcon(),
              ],
            ),

            SizedBox(height: 12.h),

            Text(
              "My Bookings",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,
              ),
            ),
          ],
        ),
      ),

      // Floating Statistics Card
      Positioned(
        left: 16.w,
        right: 16.w,
        bottom: -35.h,
        child: _statisticsCard(
          total: total,
          pending: pending,
          completed: completed,
          cancelled: cancelled,
        ),
      ),
    ],
  );
}

Widget _statisticsCard({
  required int total,
  required int pending,
  required int completed,
  required int cancelled,
}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.08),
          blurRadius: 15,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: Row(
      children: [
        _countItem(total.toString(), "Total"),

        _countItem(pending.toString(), "Pending", color: Colors.orange),

        _countItem(completed.toString(), "Completed", color: Colors.green),

        _countItem(cancelled.toString(), "Cancelled", color: Colors.red),
      ],
    ),
  );
}

Widget _headerIcon(IconData icon) {
  return Container(
    width: 40.w,
    height: 40.w,
    decoration: BoxDecoration(
      color: Colors.white24,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Icon(icon, color: Colors.white),
  );
}

Widget _countItem(
  String value,
  String label, {
  Color color = Colors.deepPurple,
}) {
  return Expanded(
    flex: 3,
    child: Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),

        SizedBox(height: 4.h),

        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 11.sp),
        ),
      ],
    ),
  );
}

Widget _notificationIcon() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: const Icon(Icons.notifications_none, color: Colors.white),
      ),

      Positioned(
        right: 6,
        top: 6,
        child: Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
            color: const Color(0xffF9C300), // Yellow dot
            shape: BoxShape.circle,
          ),
        ),
      ),
    ],
  );
}
