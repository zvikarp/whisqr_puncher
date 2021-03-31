import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/models/reward.dart';
import 'package:whisqr_puncher/stores/index.dart';
import 'package:whisqr_puncher/widgets/puncher/button/behavior.dart';
import 'package:whisqr_puncher/widgets/puncher/button/reward.dart';

class PuncherOptionsWidget extends StatelessWidget {
  PuncherOptionsWidget({
    required this.punchCode,
    this.punchDetails = const {},
  });

  final String? punchCode;
  final Map<String, dynamic>? punchDetails;

  @override
  Widget build(BuildContext context) {
    List<Behaviour> behaviours = stores.business(context).behaviours;
    List<Reward> rewards = stores.business(context).rewards;
    return Column(children: [
      ...behaviours
          .map(
            (Behaviour behaviour) => PuncherBehaviorButtonWidget(
              punchCode: punchCode ?? '',
              behaviourPunches: 100,
              behaviour: behaviour,
            ),
          )
          .toList(),
      BodyText2('Rewards'),
      ...rewards
          .map(
            (Reward reward) => PuncherRewardButtonWidget(reward: reward),
          )
          .toList()
    ]);
  }
}
