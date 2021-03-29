import 'package:whisqr_puncher/enums/behaviourType.dart';
import 'package:whisqr_puncher/models/behaviourFields/basicPunch.dart';

abstract class BehaviourFields {
  BehaviourFields();

  Map<String, dynamic> toMap();

  BehaviourFields.clone(BehaviourFields fields);

  factory BehaviourFields.fromStringMap(
      BehaviourType type, Map<String, dynamic> map) {
    if (type == BehaviourType.BASICPUNCH)
      return BasicPunchFields.fromStringMap(map);
    return null;
  }
}
