import 'package:flutter/material.dart';

import 'package:whisqr_puncher/enums/behaviourType.dart';
import 'package:whisqr_puncher/models/behaviourFields/fields.dart';

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
      fields: BehaviourFields.fromBehaviourMap(type, map['fields']),
      type: type,
    );
  }
}
