import 'package:whisqr_puncher/extensions/string.dart';

class Reward {
  Reward({
    required this.active,
    required this.index,
    this.name = '',
    this.punchCost = 0,
  });
  final bool active;
  final String? name;
  final int index;
  final int punchCost;

  factory Reward.fromStringMap(Map<String, dynamic> map, int index) {
    return Reward(
      active: map['active'].toString().parseBool(),
      name: map['fields']['rewardname'],
      index: index,
      punchCost: int.parse(map['fields']['punchcost'].toString()),
    );
  }
}
