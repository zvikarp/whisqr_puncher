import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/enums/behaviourType.dart';
import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/models/reward.dart';
import 'package:whisqr_puncher/utils/api/index.dart';
import 'package:whisqr_puncher/utils/enum.dart';
import 'package:whisqr_puncher/widgets/puncher/button/behavior.dart';
import 'package:whisqr_puncher/widgets/puncher/button/reward.dart';
import 'package:whisqr_puncher/extensions/iterable.dart';

class PuncherOptionsWidget extends StatefulWidget {
  @override
  _PuncherOptionsWidgetState createState() => _PuncherOptionsWidgetState();
}

class _PuncherOptionsWidgetState extends State<PuncherOptionsWidget> {
  List<Behaviour> _behaviours = [];
  List<Reward> _rewards = [];

  Future<void> _getBehaviours() async {
    var res = await apiUtil.business.getBehaviours();
    Map<String, dynamic> behavioursAsMap = res.data['settings_behaviours'];
    List<Behaviour> behaviours = [];
    behavioursAsMap.forEach((String key, dynamic value) {
      BehaviourType type = enumUtil.fromString(key, BehaviourType.values);
      Behaviour behaviour = Behaviour.fromStringMap(type, value);
      behaviours.add(behaviour);
    });
    setState(() => _behaviours = behaviours);
  }

  Future<void> _getRewards() async {
    var res = await apiUtil.business.getRewards();
    List<dynamic> rewardsAsList = res.data['settings_rewards'];
    List<Reward> rewards = rewardsAsList
        .mapIndexed<Reward>(
          (dynamic reward, int index) =>
              Reward.fromStringMap(Map.from(reward), index),
        )
        .toList();
    setState(() => _rewards = rewards);
  }

  @override
  void initState() {
    super.initState();
    _getBehaviours();
    _getRewards();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ..._behaviours
          .map(
            (Behaviour behaviour) =>
                PuncherBehaviorButtonWidget(behaviour: behaviour),
          )
          .toList(),
      BodyText2('Rewards'),
      ..._rewards
          .map(
            (Reward reward) => PuncherRewardButtonWidget(reward: reward),
          )
          .toList()
    ]);
  }
}
