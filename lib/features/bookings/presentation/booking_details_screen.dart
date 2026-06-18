import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/app_router.gr.dart';
import '../../../data/models/booking_model.dart';

@RoutePage()
class BookingDetailsScreen extends StatelessWidget {
  final BookingModel booking;

  const BookingDetailsScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F8),
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCustomerCard(booking),
                  SizedBox(height: 18.h),
                  _buildBookingDetailsCard(booking),
                  SizedBox(height: 18.h),
                  _buildPaymentCard(booking),
                  SizedBox(height: 18.h),
                  _buildInstructionCard(),
                  SizedBox(height: 28.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            booking.customerName,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "Booking ID : BK00${booking.id}",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(.15),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          booking.status,
                          style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 22.h),
                  Text(
                    "Ritual Information",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 14.h),

                  _detailTile(Icons.temple_hindu, "Ritual", booking.ritualName),
                  _detailTile(Icons.schedule, "Duration", "2 - 3 Hours"),
                  _detailTile(Icons.calendar_month, "Date", booking.date),
                  _detailTile(Icons.access_time, "Time", "10:00 AM"),
                  _detailTile(
                    Icons.currency_rupee,
                    "Amount",
                    "₹${booking.amount}",
                  ),

                  SizedBox(height: 24.h),
                  Text(
                    "Customer Details",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 14.h),

                  _detailTile(Icons.phone, "Phone Number", "+91 9876543210"),
                  _detailTile(
                    Icons.location_on,
                    "Address",
                    "12, Temple Street, Chennai",
                  ),

                  SizedBox(height: 24.h),
                  Text(
                    "Priest Details",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 14.h),

                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 26.r,
                          backgroundColor: const Color(0xff5B2396),
                          child: Text(
                            "SP",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sharma Pandit",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              const Text(
                                "15 Years Experience",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),
                  Text(
                    "Payment Summary",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 14.h),

                  Container(
                    padding: EdgeInsets.all(18.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      children: [
                        _paymentRow("Booking Amount", "₹46,000"),
                        const Divider(),
                        _paymentRow("Advance Paid", "₹20,000"),
                        const Divider(),
                        _paymentRow(
                          "Remaining",
                          "₹26,000",
                          valueColor: Colors.red,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 32.h),
                  SizedBox(
                    width: double.infinity,
                    height: 58.h,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.pushRoute(
                          OtpRoute(
                            booking: booking,
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.verified_user_outlined,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Verify Ritual",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff5B2396),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailTile(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xff5B2396)),
        title: Text(title),
        subtitle: Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _paymentRow(
    String title,
    String value, {
    Color valueColor = Colors.black,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: const TextStyle(color: Colors.grey)),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 18.w,
        right: 18.w,
        top: 48.h,
        bottom: 26.h,
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
              InkWell(
                onTap: () => context.router.pop(),
                child: Container(
                  width: 42.w,
                  height: 42.w,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BK-${booking.id} • ${booking.date}",
                      style: TextStyle(color: Colors.white70, fontSize: 11.sp),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      booking.ritualName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildCustomerCard(BookingModel booking) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.05),
          blurRadius: 15,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.person, size: 18, color: Color(0xff6B4CB3)),
            SizedBox(width: 8.w),
            Text(
              "CUSTOMER DETAILS",
              style: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xff6B4CB3),
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        SizedBox(height: 18.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 52.w,
              height: 52.w,
              decoration: BoxDecoration(
                color: const Color(0xff5B2396),
                borderRadius: BorderRadius.circular(12.r),
              ),
              alignment: Alignment.center,
              child: Text(
                booking.customerName.split(" ").map((e) => e.isNotEmpty ? e[0] : '').take(2).join(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    booking.customerName,
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    "Premium Devotee",
                    style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 14,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        "4.8 (104 bookings)",
                        style: TextStyle(
                          color: const Color(0xff6B4CB3),
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 18.h),
        _infoRow(Icons.phone, "+91 98765 43210"),
        SizedBox(height: 12.h),
        _infoRow(Icons.email_outlined, "rajesh@gmail.com"),
        SizedBox(height: 12.h),
        _infoRow(Icons.location_on, "Chennai, Tamil Nadu"),
      ],
    ),
  );
}

Widget _infoRow(IconData icon, String text) {
  return Row(
    children: [
      Icon(icon, size: 18, color: Colors.grey),
      SizedBox(width: 12.w),
      Expanded(
        child: Text(
          text,
          style: TextStyle(fontSize: 14.sp, color: Colors.black87),
        ),
      ),
    ],
  );
}

Widget _buildBookingDetailsCard(BookingModel booking) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.05),
          blurRadius: 15,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.assignment_outlined,
              color: Color(0xff6B4CB3),
              size: 18,
            ),
            SizedBox(width: 8.w),
            Text(
              "BOOKING DETAILS",
              style: TextStyle(
                color: const Color(0xff6B4CB3),
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        SizedBox(height: 18.h),
        _bookingItem(
          Icons.local_fire_department,
          "Service",
          booking.ritualName,
          Colors.orange,
        ),
        _bookingItem(Icons.schedule, "Duration", "2–3 Hours", Colors.grey),
        _bookingItem(Icons.calendar_today, "Date", booking.date, Colors.red),
        _bookingItem(
          Icons.access_time,
          "Time",
          booking.time,
          Colors.deepPurple,
        ),
        _bookingItem(
          Icons.location_on,
          "Location",
          "Rajesh's Residence, Chennai",
          Colors.red,
        ),
        _bookingItem(Icons.groups, "Attendees", "~25 Persons", Colors.blue),
      ],
    ),
  );
}

Widget _bookingItem(
  IconData icon,
  String title,
  String value,
  Color iconColor,
) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16.h),
    child: Row(
      children: [
        Icon(icon, size: 18, color: iconColor),
        SizedBox(width: 12.w),
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 14.sp),
          ),
        ),
        Expanded(
          flex: 3,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildPaymentCard(BookingModel booking) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.05),
          blurRadius: 15,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.account_balance_wallet_outlined,
              color: Color(0xff5B2396),
            ),
            SizedBox(width: 8.w),
            Text(
              "PAYMENT DETAILS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color(0xff5B2396),
                fontSize: 12.sp,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        _paymentItem("Booking Amount", "₹${booking.amount}"),
        const Divider(),
        _paymentItem("Advance Paid", "₹20,000"),
        const Divider(),
        _paymentItem(
          "Remaining",
          "₹${booking.amount - 20000}",
          valueColor: Colors.red,
        ),
      ],
    ),
  );
}

Widget _paymentItem(
  String title,
  String value, {
  Color valueColor = Colors.black,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 14.sp),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
        ),
      ],
    ),
  );
}

Widget _buildInstructionCard() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.05),
          blurRadius: 15,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.description_outlined, color: Color(0xff5B2396)),
            SizedBox(width: 8.w),
            Text(
              "SPECIAL INSTRUCTIONS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color(0xff5B2396),
                fontSize: 12.sp,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          "Please arrive 30 minutes before the scheduled time. Ritual materials will be arranged by the customer. Traditional attire is preferred.",
          style: TextStyle(
            height: 1.6,
            color: Colors.grey.shade700,
            fontSize: 14.sp,
          ),
        ),
      ],
    ),
  );
}