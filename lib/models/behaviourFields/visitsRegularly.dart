import 'package:whisqr_puncher/models/behaviourFields/fields.dart';

class VisitsRegularlyFields extends BehaviourFields {
  VisitsRegularlyFields({
    this.punches,
  });

  final int punches;

  @override
  Map<String, dynamic> toMap() => {
        'punches': punches,
      };

  factory VisitsRegularlyFields.fromStringMap(Map<String, dynamic> map) =>
      VisitsRegularlyFields(
        punches: int.parse(map['punches'].toString()),
      );
}
