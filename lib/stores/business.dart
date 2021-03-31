import 'package:mobx/mobx.dart';

import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/models/reward.dart';

part 'business.g.dart';

class BusinessStore = _BusinessStore with _$BusinessStore;

abstract class _BusinessStore with Store {
  // behaviour

  @observable
  ObservableList<Behaviour> _behaviours = ObservableList<Behaviour>.of([]);

  @action
  void setAllBehaviours(List<Behaviour> behaviours) {
    _behaviours = ObservableList<Behaviour>.of(behaviours);
  }

  @computed
  List<Behaviour> get behaviours => _behaviours;

  // reward

  @observable
  ObservableList<Reward> _rewards = ObservableList<Reward>.of([]);

  @action
  void setAllRewards(List<Reward> rewards) {
    _rewards = ObservableList<Reward>.of(rewards);
  }

  @computed
  List<Reward> get rewards => _rewards;
}
