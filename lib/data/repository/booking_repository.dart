import '../datasource/local/booking_local_datasource.dart';
import '../models/booking_model.dart';

class BookingRepository {
  final BookingLocalDatasource datasource = BookingLocalDatasource();

  Future<List<BookingModel>> getBookings() async {
    return datasource.getBookings();
  }
}
