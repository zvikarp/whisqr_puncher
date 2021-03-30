import 'package:flutter/material.dart';

import 'package:whisqr_puncher/enums/behaviourType.dart';
import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/utils/enum.dart';
import 'package:whisqr_puncher/widgets/puncher/button/counterButton.dart';
import 'package:whisqr_puncher/widgets/puncher/button/toggleButton.dart';

class PuncherBehaviorButtonWidget extends StatelessWidget {
  PuncherBehaviorButtonWidget({
    @required this.punchCode,
    @required this.behaviourPunches,
    @required this.behaviour,
  });

  final String punchCode;
  final int behaviourPunches;
  final Behaviour behaviour;

  @override
  Widget build(BuildContext context) {
    if (behaviour.type == BehaviourType.BASICPUNCH) {
      return PuncherToggleButtonWidget(
        text: enumUtil.string(behaviour.type),
        value: true,
        onToggle: (value) {},
      );
    }
    return PuncherCounterButtonWidget(
      text: enumUtil.string(behaviour.type),
      onTapAdd: () {},
      onTapReduce: () {},
    );
  }
}
