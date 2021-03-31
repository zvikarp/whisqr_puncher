import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';
import 'package:whisqr_puncher/consts/theme.dart';
import 'package:whisqr_puncher/enums/behaviourType.dart';

import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/models/customer.dart';
import 'package:whisqr_puncher/models/reward.dart';
import 'package:whisqr_puncher/stores/index.dart';
import 'package:whisqr_puncher/widgets/puncher/button/behaviour.dart';
import 'package:whisqr_puncher/widgets/puncher/button/reward.dart';

class PuncherOptionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      List<Behaviour> behaviours = stores.business(context).behaviours;
      List<Reward> rewards = stores.business(context).rewards;
      Customer? customer = stores.customer(context, true).customer;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...behaviours
              .where((Behaviour behaviour) =>
                  behaviour.active && behaviour.type != BehaviourType.unknown)
              .map(
                (Behaviour behaviour) => PuncherBehaviourButtonWidget(
                  punchCode: customer?.punchCode ?? '',
                  behaviourDetails: customer?.details[behaviour.type] ?? {},
                  behaviour: behaviour,
                ),
              )
              .toList(),
          Padding(
            padding: const EdgeInsets.all(ThemeConsts.L_PAD),
            child: BodyText2('Rewards'),
          ),
          ...rewards
              .map(
                (Reward reward) => PuncherRewardButtonWidget(reward: reward),
              )
              .toList()
        ],
      );
    });
  }
}
