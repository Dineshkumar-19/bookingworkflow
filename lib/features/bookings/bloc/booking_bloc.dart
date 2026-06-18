import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/booking_model.dart';
import '../../../data/repository/booking_repository.dart';
import 'booking_event.dart';
import 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepository repository;
  BookingBloc(this.repository) : super(BookingInitial()) {
    on<LoadBookings>(_loadBookings);
    on<SearchBookings>(_searchBookings);
    on<FilterBookings>(_filterBookings);
  }

  List<BookingModel> allBookings = [];

  String currentSearch = "";

  String currentFilter = "All";

  Future<void> _loadBookings(
    LoadBookings event,
    Emitter<BookingState> emit,
  ) async {
    emit(BookingLoading());

    try {
      allBookings = await repository.getBookings();

      _applyFilters(emit);
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }

  void _searchBookings(SearchBookings event, Emitter<BookingState> emit) {
    currentSearch = event.query;

    _applyFilters(emit);
  }

  void _filterBookings(FilterBookings event, Emitter<BookingState> emit) {
    currentFilter = event.status;

    _applyFilters(emit);
  }

  void _applyFilters(Emitter<BookingState> emit) {
    List<BookingModel> filtered = allBookings;

    /// Status Filter
    if (currentFilter != "All") {
      filtered = filtered.where((booking) {
        return booking.status == currentFilter;
      }).toList();
    }

    /// Search Filter
    if (currentSearch.isNotEmpty) {
      filtered = filtered.where((booking) {
        return booking.customerName.toLowerCase().contains(
          currentSearch.toLowerCase(),
        );
      }).toList();
    }

    emit(BookingLoaded(filtered));
  }
}
