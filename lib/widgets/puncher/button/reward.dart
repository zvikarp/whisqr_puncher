import 'package:flutter/material.dart';

import 'package:whisqr_puncher/models/reward.dart';
import 'package:whisqr_puncher/widgets/puncher/button/button.dart';

class PuncherRewardButtonWidget extends StatelessWidget {
  PuncherRewardButtonWidget({
    this.reward,
  });

  final Reward reward;

  @override
  Widget build(BuildContext context) {
    return PuncherPunchButtonWidget(text: reward.name);
  }
}
