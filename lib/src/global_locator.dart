import 'package:get_it/get_it.dart';
import 'package:prueba_tecnica/src/common/bloc/auth/auth_bloc.dart';
import 'package:prueba_tecnica/src/common/bloc/connection/connection_cubit.dart';

late GetIt global;

void setUpGlobalLocator() {
  global = GetIt.I;
  global
    ..registerLazySingleton<AuthBloc>(AuthBloc.new)
    ..registerLazySingleton<ConnectionCubit>(ConnectionCubit.new);
  // global.registerLazySingleton<UtilsBloc>(() => UtilsBloc());
}
