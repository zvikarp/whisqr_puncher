import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/consts/theme.dart';
import 'package:whisqr_puncher/enums/behaviourType.dart';
import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/models/customer.dart';
import 'package:whisqr_puncher/models/reward.dart';
import 'package:whisqr_puncher/stores/index.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/widgets/puncher/basic.dart';
import 'package:whisqr_puncher/widgets/puncher/friends.dart';
import 'package:whisqr_puncher/widgets/puncher/reward.dart';
import 'package:whisqr_puncher/widgets/puncher/myTreat.dart';
import 'package:whisqr_puncher/widgets/puncher/specials.dart';

class PuncherOptionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      Map<BehaviourType, Behaviour> behaviours =
          stores.business(context).behaviours;
      List<Reward> rewards = stores.business(context).rewards;
      Customer? customer = stores.customer(context, true).customer;
      if (customer == null) return Text('screen.puncher.missing-code'); // TODO
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PuncherBasicWidget(
            punchCode: customer.punchCode,
            basic: behaviours[BehaviourType.basicpunch],
          ),
          PuncherFriendsWidget(
            punchCode: customer.punchCode,
            friends: behaviours[BehaviourType.broughtfriend],
          ),
          PuncherSpecialsWidget(
            punchCode: customer.punchCode,
            opportunist: behaviours[BehaviourType.opportunist],
          ),
          PuncherMyTreatWidget(
            punchCode: customer.punchCode,
            myTreat: behaviours[BehaviourType.mytreat],
          ),
          Padding(
            padding: const EdgeInsets.all(ThemeConsts.L_PAD),
            child: BodyText2(l18nUtil.t('screen.puncher.rewards-tl')),
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
