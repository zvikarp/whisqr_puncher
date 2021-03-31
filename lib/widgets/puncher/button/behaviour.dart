import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:whisqr_puncher/enums/behaviourType.dart';
import 'package:whisqr_puncher/models/behaviour.dart';
// import 'package:whisqr_puncher/stores/index.dart';
import 'package:whisqr_puncher/utils/api/index.dart';
import 'package:whisqr_puncher/utils/enum.dart';
import 'package:whisqr_puncher/widgets/puncher/button/counterButton.dart';
import 'package:whisqr_puncher/widgets/puncher/button/toggleButton.dart';

class PuncherBehaviourButtonWidget extends StatelessWidget {
  PuncherBehaviourButtonWidget({
    required this.punchCode,
    required this.behaviourDetails,
    required this.behaviour,
  });

  final String punchCode;
  final Map<String, dynamic> behaviourDetails;
  final Behaviour behaviour;

  Future<void> _updateBehaviour(
      BuildContext context, Map<String, dynamic> details, int amout) async {
    // await stores.customer(context).setCustomer(customer);
    Response? response = await apiUtil.punch.update(punchCode, details);
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    print(behaviourDetails);
    switch (behaviour.type) {
      case BehaviourType.basicpunch:
        return PuncherToggleButtonWidget(
          text: enumUtil.string(behaviour.type),
          value: true,
          onToggle: (value) {},
        );
      case BehaviourType.broughtfriend:
        return PuncherCounterButtonWidget(
          text: enumUtil.string(behaviour.type) +
              (behaviourDetails['friendcount'] ?? 0).toString(),
          onTapAdd: () => _updateBehaviour(
              context,
              {
                "basicpunch": {"punchcount": 8},
              },
              1),
          onTapReduce: () {},
        );
      default:
        return PuncherCounterButtonWidget(
          text: enumUtil.string(behaviour.type),
          onTapAdd: () {},
          onTapReduce: () {},
        );
    }
  }
}
