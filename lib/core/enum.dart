part of "core.dart";

extension EnumExt on Enum {
  static Enum? enumFromString(String? key, Iterable<Enum> values) =>
      values.firstWhereOrNull((v) => key == v.name);
}
