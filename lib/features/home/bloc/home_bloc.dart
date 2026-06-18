import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/booking_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BookingRepository repository;

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<LoadHomeData>(_loadBookings);
  }

  Future<void> _loadBookings(
    LoadHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    try {
      final bookings = await repository.getBookings();

      if (bookings.isEmpty) {
        emit(HomeEmpty());
      } else {
        emit(HomeLoaded(bookings));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
