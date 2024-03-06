import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'connection_state.dart';

class ConnectionCubit extends Cubit<ConnectionLocalState> {
  ConnectionCubit() : super(const ConnectionInitial());
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  void connectionChanged(ConnectivityResult result) {
    emit(ConnectionChanged(connectionStatus: result));
  }

  Future<void> initConnectivity() async {
    // late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      await connectivity.checkConnectivity().then((value) {
        developer.log('$value');
        emit(ConnectionChanged(connectionStatus: value));
      });
    } on PlatformException catch (e) {
      developer.log(" Couldn't check connectivity status", error: e);
      return;
    }
  }

  // cancel the subscription when the state is destroyed
  @override
  Future<void> close() {
    connectivitySubscription.cancel();
    return super.close();
  }
}
