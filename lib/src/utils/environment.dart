enum Language { es, en, fr }

abstract class Environment {
  static Network network = const Network._();
}

class Network {
  const Network._();

  Map<String, String> get headers => const {
        'x-api-key:': String.fromEnvironment('x-api-key'),
      };
}
