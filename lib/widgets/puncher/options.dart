import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/consts/theme.dart';
import 'package:whisqr_puncher/enums/behaviourType.dart';
import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/models/customer.dart';
import 'package:whisqr_puncher/models/reward.dart';
import 'package:whisqr_puncher/stores/index.dart';
import 'package:whisqr_puncher/utils/api/index.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/widgets/puncher/basic.dart';
import 'package:whisqr_puncher/widgets/puncher/friends.dart';
import 'package:whisqr_puncher/widgets/puncher/reward.dart';
import 'package:whisqr_puncher/widgets/puncher/myTreat.dart';
import 'package:whisqr_puncher/widgets/puncher/specials.dart';

class PuncherOptionsWidget extends StatefulWidget {
  @override
  _PuncherOptionsWidgetState createState() => _PuncherOptionsWidgetState();
}

class _PuncherOptionsWidgetState extends State<PuncherOptionsWidget> {
  Future<void> _onChangeDetails(String key, dynamic value) async {
    Customer? customer = stores.customer(context).customer;
    if (customer != null) {
      customer.details[key] = value;
      Response? customerRes =
          await apiUtil.punch.update(customer.punchCode, customer.details);
      if (customerRes?.statusCode == 200) {
        Customer updatedCustomer = Customer.fromStringMap(customerRes?.data);
        stores.customer(context).setCustomer(updatedCustomer);
        print(updatedCustomer);
      }
    } else {
      print('no customer');
    }
  }

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
            friendsBehavior: behaviours[BehaviourType.broughtfriend],
            customerFriends: customer.details['broughtfriend'] ?? {},
            onChangeCustomerFriends: (friends) =>
                _onChangeDetails('broughtfriend', friends),
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
