import 'package:whisqr_puncher/models/behaviourFields/fields.dart';

class BroughtFriendFields extends BehaviourFields {
  BroughtFriendFields({
    this.rewardLevels,
  });

  final Map<int, int> rewardLevels;

  @override
  Map<String, dynamic> toMap() => {
        'rewardLevels': rewardLevels,
      };

  factory BroughtFriendFields.fromMap(Map<String, dynamic> map) =>
      BroughtFriendFields(
        rewardLevels: map['rewardLevels'],
      );
}
