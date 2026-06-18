import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/home_header.dart';
import '../../../data/repository/booking_repository.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import 'widgets/custom_bottom_navbar.dart';

import 'widgets/overview_section.dart';
import 'widgets/recent_booking_section.dart';
import 'widgets/upcoming_ritual_card.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  Future<void> _refresh(BuildContext context) async {
    context.read<HomeBloc>().add(LoadHomeData());

    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(BookingRepository())..add(LoadHomeData()),

      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is HomeError) {
            return Scaffold(body: Center(child: Text(state.message)));
          }

          if (state is HomeEmpty) {
            return Scaffold(
              body: RefreshIndicator(
                onRefresh: () => _refresh(context),
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    SizedBox(height: 250),
                    Center(child: Text("No Bookings Found")),
                  ],
                ),
              ),
            );
          }

          if (state is HomeLoaded) {
            return Scaffold(
              backgroundColor: const Color(0xffF6F6F8),

              body: RefreshIndicator(
                onRefresh: () => _refresh(context),

                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),

                  children: [
                    const HomeHeader(),

                    SizedBox(height: 20.h),

                    OverviewSection(bookings: state.bookings),

                    SizedBox(height: 24.h),

                    RecentBookingSection(bookings: state.bookings),

                    SizedBox(height: 24.h),

                    const UpcomingRitualCard(),

                    SizedBox(height: 100.h),
                  ],
                ),
              ),

              bottomNavigationBar: const CustomBottomNavbar(selectedIndex: 0),
            );
          }

          return const Scaffold();
        },
      ),
    );
  }
}
