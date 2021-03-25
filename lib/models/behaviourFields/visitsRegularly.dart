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

  factory VisitsRegularlyFields.fromMap(Map<String, dynamic> map) =>
      VisitsRegularlyFields(
        punches: map['punches'],
      );
}
