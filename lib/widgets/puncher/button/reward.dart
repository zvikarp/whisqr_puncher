import 'package:flutter/material.dart';

import 'package:whisqr_puncher/models/reward.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/widgets/puncher/button/counterButton.dart';

class PuncherRewardButtonWidget extends StatelessWidget {
  PuncherRewardButtonWidget({
    this.reward,
  });

  final Reward? reward;

  @override
  Widget build(BuildContext context) {
    return PuncherCounterButtonWidget(
      text: reward?.name ?? l18nUtil.t('model.reward.missing-name'),
      onTapAdd: () {},
      onTapReduce: () {},
    );
  }
}
