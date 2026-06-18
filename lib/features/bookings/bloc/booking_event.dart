import 'package:equatable/equatable.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  List<Object?> get props => [];
}

class LoadBookings extends BookingEvent {}

class SearchBookings extends BookingEvent {
  final String query;

  const SearchBookings(this.query);

  @override
  List<Object?> get props => [query];
}

class FilterBookings extends BookingEvent {
  final String status;

  const FilterBookings(this.status);

  @override
  List<Object?> get props => [status];
}
