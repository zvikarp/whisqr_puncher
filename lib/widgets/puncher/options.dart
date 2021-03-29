import 'package:flutter/material.dart';

import 'package:whisqr_puncher/enums/behaviourType.dart';
import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/utils/api/index.dart';
import 'package:whisqr_puncher/utils/enum.dart';

class PuncherOptionsWidget extends StatefulWidget {
  @override
  _PuncherOptionsWidgetState createState() => _PuncherOptionsWidgetState();
}

class _PuncherOptionsWidgetState extends State<PuncherOptionsWidget> {
  List<Behaviour> _behaviours = [];

  Future<void> _getBehaviours() async {
    var res = await apiUtil.business.getBehaviours();
    print(res);
    print(res.data);
    print(res.data['settings_behaviours']);
    Map<String, dynamic> behavioursAsMap = res.data['settings_behaviours'];
    List<Behaviour> behaviours = [];
    behavioursAsMap.forEach((String key, dynamic value) {
      BehaviourType type = enumUtil.fromString(key, BehaviourType.values);
      Behaviour behaviour = Behaviour.fromMap(type, value);
      behaviours.add(behaviour);
    });
    setState(() => _behaviours = behaviours);
  }

  @override
  void initState() {
    super.initState();
    _getBehaviours();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _behaviours
          .map((Behaviour behaviour) => Text(enumUtil.string(behaviour.type)))
          .toList(),
    );
  }
}
