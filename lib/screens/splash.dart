import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:whisqr_puncher/enums/behaviourType.dart';
import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/models/reward.dart';
import 'package:whisqr_puncher/models/user.dart';
import 'package:whisqr_puncher/stores/index.dart';
import 'package:whisqr_puncher/utils/api/index.dart';
import 'package:whisqr_puncher/utils/enum.dart';
import 'package:whisqr_puncher/utils/router.gr.dart';
import 'package:whisqr_puncher/utils/storage.dart';
import 'package:whisqr_puncher/extensions/iterable.dart';

class SpalshScreen extends StatefulWidget {
  @override
  _SpalshScreenState createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  Future<void> _loadBusinessSettings() async {
    await _getBehaviours();
    await _getRewards();
  }

  Future<void> _getBehaviours() async {
    Response? res = await apiUtil.business.getBehaviours();
    Map<String, dynamic> behavioursAsMap = res?.data['settings_behaviours'];
    Map<BehaviourType, Behaviour> behaviours =
        behavioursAsMap.map((String key, dynamic value) {
      BehaviourType type = enumUtil.fromString(key, BehaviourType.values) ??
          BehaviourType.unknown;
      Behaviour behaviour = Behaviour.fromStringMap(type, value);
      return MapEntry(type, behaviour);
    });
    stores.business(context).setAllBehaviours(behaviours);
  }

  Future<void> _getRewards() async {
    Response? res = await (apiUtil.business.getRewards());
    List<dynamic> rewardsAsList = res?.data?['settings_rewards'] ?? [];
    List<Reward> rewards = rewardsAsList
        .mapIndexed<Reward>(
          (dynamic reward, int index) =>
              Reward.fromStringMap(Map.from(reward), index),
        )
        .toList();
    stores.business(context).setAllRewards(rewards);
  }

  Future<void> _loadData() async {
    User user = await storageUtil.getUser();
    await Future.delayed(Duration.zero);
    if (user.isValid()) {
      await apiUtil.setHeaders();
      await _loadBusinessSettings();
      // WIP
      // AutoRouter.of(context).replace(ScannerScreenRoute());
      AutoRouter.of(context).replace(
          PuncherScreenRoute(link: 'https://loyalty.whisqr.com/card/4PKuZ9C'));
    } else {
      AutoRouter.of(context).replace(SigninScreenRoute());
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
