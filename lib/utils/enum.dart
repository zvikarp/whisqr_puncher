class EnumUtil {
  String string(Object o) => o.toString().split('.').last;

  T fromString<T>(String key, List<T> values) => values
      .firstWhere((v) => key.toUpperCase() == string(v), orElse: () => null);
}

final EnumUtil enumUtil = EnumUtil();
