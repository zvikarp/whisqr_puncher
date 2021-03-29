import 'package:flutter/material.dart';

import 'package:whisqr_puncher/enums/behaviourType.dart';
import 'package:whisqr_puncher/models/behaviourFields/fields.dart';
import 'package:whisqr_puncher/extensions/string.dart';

class Behaviour {
  Behaviour({
    @required this.active,
    @required this.fields,
    @required this.type,
  });

  final bool active;
  final BehaviourFields fields;
  final BehaviourType type;

  factory Behaviour.fromMap(BehaviourType type, Map<String, dynamic> map) {
    return Behaviour(
      active: map['active'],
      fields: BehaviourFields.fromStringMap(type, map['fields']),
      type: type,
    );
  }

  factory Behaviour.fromStringMap(
      BehaviourType type, Map<String, dynamic> map) {
    return Behaviour(
      active: map['active'].toString().parseBool(),
      fields: BehaviourFields.fromStringMap(type, map['fields']),
      type: type,
    );
  }
}
