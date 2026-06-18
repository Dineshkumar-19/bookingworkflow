import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/booking_model.dart';
import 'package:flutter/services.dart';

@RoutePage()
class OtpScreen extends StatefulWidget {
  final BookingModel booking;

  const OtpScreen({super.key, required this.booking});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int secondsRemaining = 30;
  Timer? timer;
  final List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();

    secondsRemaining = 30;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();

    for (final c in controllers) {
      c.dispose();
    }

    for (final f in focusNodes) {
      f.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F8),

      body: Column(
        children: [
          _buildHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(18.w),

              child: Column(
                children: [
                  _ritualCard(),

                  SizedBox(height: 30.h),

                  Text(
                    "Verification Code",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Text(
                    "Enter the 4-digit OTP displayed by the devotee to start the ritual.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),

                  SizedBox(height: 30.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) => _otpBox(index)),
                  ),
                  SizedBox(height: 5.h),

                  secondsRemaining == 0
                      ? TextButton(
                          onPressed: () {
                            startTimer();

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("OTP Sent Successfully"),
                              ),
                            );
                          },
                          child: const Text(
                            "Resend OTP to Devotee",
                            style: TextStyle(
                              color: Color(0xff5B2396),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Text(
                          "Resend OTP in 00:${secondsRemaining.toString().padLeft(2, '0')}",
                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        ),

                  SizedBox(height: 10.h),

                  Row(
                    children: [
                      Expanded(
                        child: _statusCard(
                          Icons.my_location,
                          "Location Verified",
                        ),
                      ),

                      SizedBox(width: 12.w),

                      Expanded(
                        child: _statusCard(
                          Icons.inventory_2_outlined,
                          "Materials Ready",
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 36.h),

                  SizedBox(
                    width: double.infinity,
                    height: 55.h,

                    child: ElevatedButton(
                      onPressed: () {
                        final otp = controllers.map((e) => e.text).join();

                        if (otp.length != 4) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please enter a valid OTP"),
                            ),
                          );
                          return;
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("OTP Verified Successfully"),
                          ),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff5B2396),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                      ),

                      child: Text(
                        "Verify and Start Ritual",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 52.h,
        left: 20.w,
        right: 20.w,
        bottom: 22.h,
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
                "Booking Registry",
                style: TextStyle(color: Colors.white70, fontSize: 12.sp),
              ),

              const Spacer(),

              _headerIcon(Icons.search),

              SizedBox(width: 10.w),

              _notificationIcon(),
            ],
          ),

          SizedBox(height: 14.h),

          Text(
            "Start Ritual",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerIcon(IconData icon) {
    return Container(
      width: 42.w,
      height: 42.w,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(icon, color: Colors.white, size: 22.sp),
    );
  }

  Widget _notificationIcon() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 42.w,
          height: 42.w,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            Icons.notifications_none,
            color: Colors.white,
            size: 22.sp,
          ),
        ),

        Positioned(
          top: 8,
          right: 8,
          child: Container(
            width: 9.w,
            height: 9.w,
            decoration: BoxDecoration(
              color: const Color(0xffFFC107),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xff5B2396), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _ritualCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          /// Ritual Image
          Container(
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
              color: const Color(0xffF7F7F7),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Image.asset(
              "assets/images/splash_logo.png",
              fit: BoxFit.fill,
            ),
          ),

          SizedBox(width: 16.w),

          /// Ritual Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "RITUAL TYPE",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .5,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  widget.booking.ritualName,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: 8.h),

                Text(
                  "₹${widget.booking.amount.toStringAsFixed(0)}",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff5B2396),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _otpBox(int index) {
    return SizedBox(
      width: 52.w,
      height: 72.h,
      child: TextField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: controllers[index],
        focusNode: focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        maxLength: 1,
        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Color(0xff5B2396), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Color(0xff5B2396), width: 2.5),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1 && index < 3) {
            FocusScope.of(context).requestFocus(focusNodes[index + 1]);
          }

          if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(focusNodes[index - 1]);
          }
        },
      ),
    );
  }

  Widget _statusCard(IconData icon, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xff5B2396), size: 26.sp),

          SizedBox(height: 10.h),

          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
