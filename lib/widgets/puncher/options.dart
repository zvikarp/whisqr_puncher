import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:load/load.dart';

import 'package:whisqr_puncher/enums/behaviourType.dart';
import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/models/customer.dart';
import 'package:whisqr_puncher/models/redeemable.dart';
import 'package:whisqr_puncher/models/reward.dart';
import 'package:whisqr_puncher/stores/index.dart';
import 'package:whisqr_puncher/utils/api/index.dart';
import 'package:whisqr_puncher/widgets/puncher/basic.dart';
import 'package:whisqr_puncher/widgets/puncher/friends.dart';
import 'package:whisqr_puncher/widgets/puncher/rewards.dart';
import 'package:whisqr_puncher/widgets/puncher/myTreat.dart';
import 'package:whisqr_puncher/widgets/puncher/specials.dart';

class PuncherOptionsWidget extends StatefulWidget {
  @override
  _PuncherOptionsWidgetState createState() => _PuncherOptionsWidgetState();
}

class _PuncherOptionsWidgetState extends State<PuncherOptionsWidget> {
  Future<void> _onChangeDetails(String key, dynamic value) async {
    showLoadingDialog();
    Customer? customer = stores.customer(context).customer;
    if (customer != null) {
      customer.details[key] = value;
      Response? customerRes =
          await apiUtil.punch.update(customer.punchCode, customer.details);
      if (customerRes?.statusCode == 200) {
        Customer updatedCustomer = Customer.fromStringMap(customerRes?.data)
            .copyWith(redemptionDetails: customer.redemptionDetails);
        stores.customer(context).setCustomer(updatedCustomer);
      }
    } else {
      print('no customer');
    }
    hideLoadingDialog();
  }

  Future<void> _onChangeRedemptionDetails(
      List<Redeemable> updatedRedemptionDetails) async {
    showLoadingDialog();
    Customer? customer = stores.customer(context).customer;
    if (customer != null) {
      customer = customer.copyWith(redemptionDetails: updatedRedemptionDetails);
      Response? customerRes = await apiUtil.redeem
          .update(customer.punchCode, customer.redemptionDetails);
      if (customerRes?.statusCode == 200) {
        Customer updatedCustomer = Customer.fromStringMap(customerRes?.data)
            .copyWith(details: customer.details);
        stores.customer(context).setCustomer(updatedCustomer);
      }
    } else {
      print('no customer');
    }
    hideLoadingDialog();
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
            customerPunch: customer.details['basicpunch'] ?? {},
            onChangeCustomerPunch: (basic) =>
                _onChangeDetails('basicpunch', basic),
          ),
          PuncherFriendsWidget(
            friendsBehavior: behaviours[BehaviourType.broughtfriend],
            customerFriends: customer.details['broughtfriend'] ?? {},
            onChangeCustomerFriends: (friends) =>
                _onChangeDetails('broughtfriend', friends),
            isPunched: customer.punchCount > 0,
          ),
          PuncherRewardWidget(
            rewards: rewards,
            customerRewards: customer.redemptionDetails,
            onChangeCustomerRewards: (updatedRedemptionDetails) =>
                _onChangeRedemptionDetails(updatedRedemptionDetails),
          ),
          PuncherSpecialsWidget(
            punchCode: customer.punchCode,
            opportunist: behaviours[BehaviourType.opportunist],
            customerOpportunist: customer.details['opportunist'] ?? {},
            onChangeCustomerSpecials: (specials) =>
                _onChangeDetails('opportunist', specials),
            isPunched: customer.punchCount > 0,
          ),
          PuncherMyTreatWidget(
            punchCode: customer.punchCode,
            myTreat: behaviours[BehaviourType.mytreat],
          ),
        ],
      );
    });
  }
}
