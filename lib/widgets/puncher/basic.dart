import 'package:flutter/material.dart';

import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/widgets/puncher/button/counterButton.dart';
import 'package:whisqr_puncher/widgets/puncher/button/toggleButton.dart';

class PuncherBasicWidget extends StatelessWidget {
  PuncherBasicWidget({
    required this.punchCode,
    required this.basic,
    required this.customerPunch,
    required this.onChangeCustomerPunch,
  });

  final String punchCode;
  final Behaviour? basic;
  final Map customerPunch;
  final Function(Map) onChangeCustomerPunch;

  _onChangeCustomerPunch(int num) {
    customerPunch['punches'] = (customerPunch['punches'] ?? 0) + num;
    onChangeCustomerPunch(customerPunch);
  }

  @override
  Widget build(BuildContext context) {
    if (basic?.fields?['multipunch'] == 'single') {
      int punchCount = customerPunch['punches'] ?? 0;
      return PuncherToggleButtonWidget(
        text: l18nUtil.t(punchCount > 0
            ? 'screen.puncher.is-punched'
            : 'screen.puncher.not-punched'),
        value: punchCount > 0,
        onToggle: (value) => _onChangeCustomerPunch(value ? 1 : -1),
      );
    } else {
      int punchCount = customerPunch['punches'] ?? 0;
      return PuncherCounterButtonWidget(
        text: l18nUtil
            .t('screen.puncher.punch-counter', {'num': punchCount.toString()}),
        reduceDisabled: punchCount < 1,
        onTapAdd: () => _onChangeCustomerPunch(1),
        onTapReduce: () => _onChangeCustomerPunch(-1),
      );
    }
  }
}
