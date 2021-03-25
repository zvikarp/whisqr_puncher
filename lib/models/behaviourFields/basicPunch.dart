import 'package:whisqr_puncher/models/behaviourFields/fields.dart';

class BasicPunchFields extends BehaviourFields {
  BasicPunchFields({
    this.punches,
  });

  final int punches;

  @override
  Map<String, dynamic> toMap() => {
        'punches': punches,
      };

  factory BasicPunchFields.fromMap(Map<String, dynamic> map) =>
      BasicPunchFields(
        punches: map['punches'],
      );
}
