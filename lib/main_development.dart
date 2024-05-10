import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/app_development.dart';
import 'package:prueba_tecnica/src/common/services/local_storage.dart';
import 'package:prueba_tecnica/src/global_locator.dart';
import 'package:prueba_tecnica/src/utils/observer_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// inicializar inyección de dependencias
  setUpGlobalLocator();
  await LocalStorage.configurePrefs();
  Bloc.observer = ObserverBloc();
  runApp(const AppDevelopment());
}
