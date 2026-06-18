import 'package:equatable/equatable.dart';

import '../../../data/models/booking_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<BookingModel> bookings;

  const HomeLoaded(this.bookings);

  @override
  List<Object?> get props => [bookings];
}

class HomeEmpty extends HomeState {}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
