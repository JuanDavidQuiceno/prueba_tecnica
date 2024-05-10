enum Language { es, en, fr }

abstract class Environment {
  static Network network = const Network._();
}

class Network {
  const Network._();

  Map<String, String> get headers => const {};

  String get urlCatImage => const String.fromEnvironment('URL_CAT_IMAGE');
}
