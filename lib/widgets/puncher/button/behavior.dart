import 'package:flutter/material.dart';

import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/utils/enum.dart';
import 'package:whisqr_puncher/widgets/puncher/button/button.dart';

class PuncherBehaviorButtonWidget extends StatelessWidget {
  PuncherBehaviorButtonWidget({
    this.behaviour,
  });

  final Behaviour behaviour;

  @override
  Widget build(BuildContext context) {
    return PuncherPunchButtonWidget(text: enumUtil.string(behaviour.type));
  }
}
