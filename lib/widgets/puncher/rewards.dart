import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/consts/theme.dart';
import 'package:whisqr_puncher/models/reward.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/widgets/puncher/button/counterButton.dart';

class PuncherRewardWidget extends StatelessWidget {
  PuncherRewardWidget({
    this.rewards = const [],
  });

  final List<Reward> rewards;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(ThemeConsts.M_PAD),
          child: HeadlineText4(l18nUtil.t('screen.puncher.rewards-tl')),
        ),
        ...rewards.map(
          (Reward reward) {
            String name =
                reward.name ?? l18nUtil.t('model.reward.missing-name');
            String punches = reward.punchCost.toString();
            return PuncherCounterButtonWidget(
              text: l18nUtil.t('screen.puncher.redeem-punch-card',
                  {'name': name, 'punches': punches}),
              onTapAdd: () {},
              onTapReduce: () {},
            );
          },
        ).toList(),
      ],
    );
  }
}
