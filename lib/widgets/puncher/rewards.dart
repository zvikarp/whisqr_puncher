import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/consts/theme.dart';
import 'package:whisqr_puncher/models/redeemable.dart';
import 'package:whisqr_puncher/models/reward.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/widgets/puncher/button/counterButton.dart';

class PuncherRewardWidget extends StatelessWidget {
  PuncherRewardWidget({
    required this.onChangeCustomerRewards,
    required this.customerRewards,
    this.rewards = const [],
  });

  final List<Reward> rewards;
  final List<Redeemable> customerRewards;
  final Function(List<Redeemable>) onChangeCustomerRewards;

  _onChangeCustomerRewards(int index, int multiplyer) {
    final List<Redeemable> updatedCustomerRewards = List.from(customerRewards);
    int listIndex = updatedCustomerRewards
        .indexWhere((Redeemable redeemable) => redeemable.index == index);
    if (listIndex >= 0) {
      updatedCustomerRewards[listIndex] =
          updatedCustomerRewards[listIndex].updateCount(multiplyer);
    } else {
      updatedCustomerRewards.add(Redeemable(index: index, count: multiplyer));
    }

    onChangeCustomerRewards(updatedCustomerRewards);
  }

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
            Redeemable customerReward = customerRewards.firstWhere(
                (Redeemable redeemable) => redeemable.index == reward.index,
                orElse: () => Redeemable(index: reward.index));
            if (customerReward.index < 0) return Container();
            return PuncherCounterButtonWidget(
              text: l18nUtil.t('screen.puncher.redeem-punch-card',
                  {'name': name, 'punches': punches}),
              onTapAdd: () => _onChangeCustomerRewards(reward.index, 1),
              onTapReduce: () => _onChangeCustomerRewards(reward.index, -1),
              reduceDisabled: customerReward.count <= 0,
            );
          },
        ).toList(),
      ],
    );
  }
}
