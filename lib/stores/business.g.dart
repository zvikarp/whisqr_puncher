// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BusinessStore on _BusinessStore, Store {
  Computed<ObservableMap<BehaviourType, Behaviour>>? _$behavioursComputed;

  @override
  ObservableMap<BehaviourType, Behaviour> get behaviours =>
      (_$behavioursComputed ??=
              Computed<ObservableMap<BehaviourType, Behaviour>>(
                  () => super.behaviours,
                  name: '_BusinessStore.behaviours'))
          .value;
  Computed<List<Reward>>? _$rewardsComputed;

  @override
  List<Reward> get rewards =>
      (_$rewardsComputed ??= Computed<List<Reward>>(() => super.rewards,
              name: '_BusinessStore.rewards'))
          .value;

  final _$_behavioursAtom = Atom(name: '_BusinessStore._behaviours');

  @override
  ObservableMap<BehaviourType, Behaviour> get _behaviours {
    _$_behavioursAtom.reportRead();
    return super._behaviours;
  }

  @override
  set _behaviours(ObservableMap<BehaviourType, Behaviour> value) {
    _$_behavioursAtom.reportWrite(value, super._behaviours, () {
      super._behaviours = value;
    });
  }

  final _$_rewardsAtom = Atom(name: '_BusinessStore._rewards');

  @override
  ObservableList<Reward> get _rewards {
    _$_rewardsAtom.reportRead();
    return super._rewards;
  }

  @override
  set _rewards(ObservableList<Reward> value) {
    _$_rewardsAtom.reportWrite(value, super._rewards, () {
      super._rewards = value;
    });
  }

  final _$_BusinessStoreActionController =
      ActionController(name: '_BusinessStore');

  @override
  void setAllBehaviours(Map<BehaviourType, Behaviour> behaviours) {
    final _$actionInfo = _$_BusinessStoreActionController.startAction(
        name: '_BusinessStore.setAllBehaviours');
    try {
      return super.setAllBehaviours(behaviours);
    } finally {
      _$_BusinessStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAllRewards(List<Reward> rewards) {
    final _$actionInfo = _$_BusinessStoreActionController.startAction(
        name: '_BusinessStore.setAllRewards');
    try {
      return super.setAllRewards(rewards);
    } finally {
      _$_BusinessStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
behaviours: ${behaviours},
rewards: ${rewards}
    ''';
  }
}
