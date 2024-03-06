import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/app_development.dart';
import 'package:prueba_tecnica/src/utils/observer_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = ObserverBloc();
  runApp(const AppDevelopment());
}
