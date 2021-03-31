import 'package:whisqr_puncher/enums/behaviourType.dart';
import 'package:whisqr_puncher/utils/enum.dart';

class Customer {
  Customer({
    required this.name,
    required this.punchCode,
    required this.cardCode,
    this.punchCount = 0,
    this.punchTotal = 0,
    this.details = const {},
  });

  final String? name;
  final String punchCode;
  final String? cardCode;
  final int? punchCount;
  final int? punchTotal;
  final Map<BehaviourType, dynamic> details;

  factory Customer.fromStringMap(Map<String, dynamic> map) => Customer(
        name: map['fullname'],
        punchCode: map['punchcode'],
        cardCode: map['cardcode'],
        punchCount: int.parse((map['punchcount'] ?? 0).toString()),
        punchTotal: int.parse((map['punchtotal'] ?? 0).toString()),
        details: Map.from(map['details'] ?? {}).map(
            (dynamic key, dynamic value) => MapEntry(
                enumUtil.fromString(key, BehaviourType.values) ??
                    BehaviourType.unknown,
                value)),
      );
}
