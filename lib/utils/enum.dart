import 'package:collection/collection.dart' show IterableExtension;

class EnumUtil {
  String string(Object? o) => o.toString().split('.').last;

  T? fromString<T>(String? key, List<T> values) => values
      .firstWhereOrNull((v) => key!.toUpperCase() == string(v));
}

final EnumUtil enumUtil = EnumUtil();
