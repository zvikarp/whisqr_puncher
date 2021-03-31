import 'package:mobx/mobx.dart';

import 'package:whisqr_puncher/enums/behaviourType.dart';
import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/models/reward.dart';

part 'business.g.dart';

class BusinessStore = _BusinessStore with _$BusinessStore;

abstract class _BusinessStore with Store {
  // behaviour

  @observable
  ObservableMap<BehaviourType, Behaviour> _behaviours =
      ObservableMap<BehaviourType, Behaviour>.of({});

  @action
  void setAllBehaviours(Map<BehaviourType, Behaviour> behaviours) {
    _behaviours =
        ObservableMap<BehaviourType, Behaviour>.linkedHashMapFrom(behaviours);
  }

  @computed
  ObservableMap<BehaviourType, Behaviour> get behaviours => _behaviours;

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
