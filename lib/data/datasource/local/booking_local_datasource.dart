import 'dart:convert';

import 'package:flutter/services.dart';

import '../../models/booking_model.dart';

class BookingLocalDatasource {
  Future<List<BookingModel>> getBookings() async {
    final jsonString = await rootBundle.loadString('assets/json/bookings.json');

    final List<dynamic> jsonData = json.decode(jsonString);

    return jsonData.map((e) => BookingModel.fromJson(e)).toList();
  }
}
