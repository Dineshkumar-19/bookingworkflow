class BookingModel {
  final int id;
  final String customerName;
  final String ritualName;
  final String date;
  final String time;
  final String status;
  final double amount;

  BookingModel({
    required this.id,
    required this.customerName,
    required this.ritualName,
    required this.date,
    required this.time,
    required this.status,
    required this.amount,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json["id"],
      customerName: json["customerName"],
      ritualName: json["ritualName"],
      date: json["date"],
      time: json["time"],
      status: json["status"],
      amount: (json["amount"] as num).toDouble(),
    );
  }
}
