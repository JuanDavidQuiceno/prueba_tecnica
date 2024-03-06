enum Language { es, en, fr }

abstract class Environment {
  static Network network = const Network._();
}

class Network {
  const Network._();

  // ignore: avoid_field_initializers_in_const_classes
  final Map<String, String> headers = const {
    'x-api-key:': String.fromEnvironment('x-api-key'),
  };
}
