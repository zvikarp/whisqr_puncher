import 'package:whisqr_puncher/models/redeemable.dart';

class Customer {
  Customer({
    required this.name,
    required this.punchCode,
    required this.cardCode,
    this.punchCount = 0,
    this.punchTotal = 0,
    this.details = const {},
    this.redemptionDetails = const [],
  });

  final String? name;
  final String punchCode;
  final String? cardCode;
  final int punchCount;
  final int? punchTotal;
  final Map<String, dynamic> details;
  final List<Redeemable> redemptionDetails;

  factory Customer.fromStringMap(Map<String, dynamic> map) => Customer(
        name: map['fullname'],
        punchCode: map['punchcode'],
        cardCode: map['cardcode'],
        punchCount: int.parse((map['punches'] ?? 0).toString()),
        punchTotal: int.parse((map['punchtotal'] ?? 0).toString()),
        details: Map.from(map['details'] ?? {}),
      );

  factory Customer.clone(Customer customer) => Customer(
        name: customer.name,
        punchCode: customer.punchCode,
        cardCode: customer.cardCode,
        punchCount: customer.punchCount,
        punchTotal: customer.punchTotal,
        details: customer.details,
        redemptionDetails: customer.redemptionDetails,
      );

  Customer copyWith({
    String? name,
    String? punchCode,
    String? cardCode,
    int? punchCount,
    int? punchTotal,
    Map<String, dynamic>? details,
    List<Redeemable>? redemptionDetails,
  }) =>
      Customer(
        name: name ?? this.name,
        punchCode: punchCode ?? this.punchCode,
        cardCode: cardCode ?? this.cardCode,
        punchCount: punchCount ?? this.punchCount,
        punchTotal: punchTotal ?? this.punchTotal,
        details: details ?? this.details,
        redemptionDetails: redemptionDetails ?? this.redemptionDetails,
      );
}
