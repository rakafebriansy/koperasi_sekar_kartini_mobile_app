typedef FromJsonFunc = dynamic Function(Map<String, dynamic> json);
typedef ToJsonFunc = Map<String, dynamic> Function(dynamic object);

class ModelRegistry {
  static final Map<Type, FromJsonFunc> fromJsonRegistry = {};
  static final Map<Type, ToJsonFunc> toJsonRegistry = {};

  static void register<T>({
    required FromJsonFunc fromJson,
    required ToJsonFunc toJson,
  }) {
    fromJsonRegistry[T] = fromJson;
    toJsonRegistry[T] = toJson;
  }

  static T fromJson<T>(Object? json) {
    if (json == null) return null as T;

    final func = fromJsonRegistry[T];
    if (func == null) {
      throw UnimplementedError('No fromJson registered for type $T');
    }
    return func(json as Map<String, dynamic>) as T;
  }

  static T fromJsonOrFallback<T>(Map<String, dynamic> json) {
    final func = fromJsonRegistry[T];
    if (func != null) {
      return func(json) as T;
    } else {
      return json as T;
    }
  }

  static Object? toJson<T>(T object) {
    if (object == null) return null;

    final func = toJsonRegistry[T];
    if (func == null) {
      throw UnimplementedError('No toJson registered for type $T');
    }
    return func(object);
  }
}
