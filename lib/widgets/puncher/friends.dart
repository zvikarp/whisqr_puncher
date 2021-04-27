import 'package:flutter/material.dart';
import 'package:whisqr_puncher/models/behaviour.dart';

import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/widgets/puncher/button/counterButton.dart';

class PuncherFriendsWidget extends StatelessWidget {
  PuncherFriendsWidget({
    required this.punchCode,
    required this.friendsBehavior,
    required this.customerFriends,
    required this.onChangeCustomerFriends,
  });

  final String punchCode;
  final Behaviour? friendsBehavior;
  final Map<String, dynamic> customerFriends;
  final Function(Map<String, dynamic>) onChangeCustomerFriends;

  _onChangeCustomerFriends(int multiplyer) {
    customerFriends['punchcount'] =
        (customerFriends['punchcount'] ?? 0) + multiplyer;
    customerFriends['friendcount'] =
        (customerFriends['friendcount'] ?? 0) + multiplyer;
    onChangeCustomerFriends(customerFriends);
  }

  String _friendsText(int numOfFriends) {
    if (numOfFriends > 0) {
      return l18nUtil
          .t('screen.puncher.have-friends', {'num': numOfFriends.toString()});
    } else {
      return l18nUtil.t('screen.puncher.no-friends');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PuncherCounterButtonWidget(
        text: _friendsText(customerFriends['friendcount'] ?? 0),
        onTapAdd: () => _onChangeCustomerFriends(1),
        onTapReduce: () => _onChangeCustomerFriends(-1));
  }
}
