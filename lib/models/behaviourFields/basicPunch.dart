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

  factory BasicPunchFields.fromStringMap(Map<String, dynamic> map) =>
      BasicPunchFields(
        punches: int.parse(map['punches'].toString()),
      );
}
