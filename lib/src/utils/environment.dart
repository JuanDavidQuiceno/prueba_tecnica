import 'dart:io';

import 'package:prueba_tecnica/src/common/services/local_storage.dart';

enum Language { es, en, fr }

enum FlavorConfig { development, production, staging, mock }

abstract class Environment {
  static Network network = const Network._();

  // variable para activar el modo mock
  static bool get isMock =>
      bool.tryParse(
        const String.fromEnvironment('MOCK'),
      ) ??
      false;
}

class Network {
  const Network._();

  Map<String, String> get headers => {
        HttpHeaders.authorizationHeader: LocalStorage.token,
      };

  String get urlCatImage => const String.fromEnvironment('URL_CAT_IMAGE');
}
