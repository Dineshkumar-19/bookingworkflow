// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:bookworkflow/data/models/booking_model.dart' as _i8;
import 'package:bookworkflow/features/bookings/presentation/booking_details_screen.dart'
    as _i1;
import 'package:bookworkflow/features/bookings/presentation/booking_screen.dart'
    as _i2;
import 'package:bookworkflow/features/home/presentation/home_screen.dart'
    as _i3;
import 'package:bookworkflow/features/ritual/presentation/otp_screen.dart'
    as _i4;
import 'package:bookworkflow/features/splash/presentation/splash_screen.dart'
    as _i5;
import 'package:flutter/material.dart' as _i7;

/// generated route for
/// [_i1.BookingDetailsScreen]
class BookingDetailsRoute extends _i6.PageRouteInfo<BookingDetailsRouteArgs> {
  BookingDetailsRoute({
    _i7.Key? key,
    required _i8.BookingModel booking,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         BookingDetailsRoute.name,
         args: BookingDetailsRouteArgs(key: key, booking: booking),
         initialChildren: children,
       );

  static const String name = 'BookingDetailsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookingDetailsRouteArgs>();
      return _i1.BookingDetailsScreen(key: args.key, booking: args.booking);
    },
  );
}

class BookingDetailsRouteArgs {
  const BookingDetailsRouteArgs({this.key, required this.booking});

  final _i7.Key? key;

  final _i8.BookingModel booking;

  @override
  String toString() {
    return 'BookingDetailsRouteArgs{key: $key, booking: $booking}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BookingDetailsRouteArgs) return false;
    return key == other.key && booking == other.booking;
  }

  @override
  int get hashCode => key.hashCode ^ booking.hashCode;
}

/// generated route for
/// [_i2.BookingScreen]
class BookingRoute extends _i6.PageRouteInfo<void> {
  const BookingRoute({List<_i6.PageRouteInfo>? children})
    : super(BookingRoute.name, initialChildren: children);

  static const String name = 'BookingRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.BookingScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.OtpScreen]
class OtpRoute extends _i6.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i7.Key? key,
    required _i8.BookingModel booking,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         OtpRoute.name,
         args: OtpRouteArgs(key: key, booking: booking),
         initialChildren: children,
       );

  static const String name = 'OtpRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>();
      return _i4.OtpScreen(key: args.key, booking: args.booking);
    },
  );
}

class OtpRouteArgs {
  const OtpRouteArgs({this.key, required this.booking});

  final _i7.Key? key;

  final _i8.BookingModel booking;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, booking: $booking}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OtpRouteArgs) return false;
    return key == other.key && booking == other.booking;
  }

  @override
  int get hashCode => key.hashCode ^ booking.hashCode;
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashScreen();
    },
  );
}
