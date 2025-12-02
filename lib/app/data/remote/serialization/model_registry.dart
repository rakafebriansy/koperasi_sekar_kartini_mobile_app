typedef FromJsonFunc = dynamic Function(Map<String, dynamic>);
typedef ToJsonFunc = Map<String, dynamic> Function(dynamic);

class ModelRegistry {
  static final Map<Type, FromJsonFunc> fromJsonRegistry = {};
  static final Map<Type, ToJsonFunc> toJsonRegistry = {};
  static final Map<String, Type> stringToType = {};

  static void register<T>({
    required FromJsonFunc fromJson,
    required ToJsonFunc toJson,
  }) {
    fromJsonRegistry[T] = fromJson;
    toJsonRegistry[T] = toJson;
    stringToType[T.toString()] = T;
  }

  static T fromJson<T>(Map<String, dynamic> json) {
    final func = fromJsonRegistry[T];
    if (func == null) {
      throw Exception('No fromJson registered for $T');
    }
    return func(json) as T;
  }

  static dynamic fromJsonByType(Type type, Map<String, dynamic> json) {
    final func = fromJsonRegistry[type];
    if (func == null) {
      throw Exception('No fromJson registered for type $type');
    }
    return func(json);
  }

}
