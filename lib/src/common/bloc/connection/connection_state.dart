part of 'connection_cubit.dart';

abstract class ConnectionLocalState extends Equatable {
  const ConnectionLocalState({
    this.connectionStatus = ConnectivityResult.none,
  });
  final ConnectivityResult? connectionStatus;

  @override
  List<Object> get props => [
        connectionStatus ?? ConnectivityResult.none,
      ];
}

class ConnectionInitial extends ConnectionLocalState {
  const ConnectionInitial() : super();
}

class ConnectionChanged extends ConnectionLocalState {
  const ConnectionChanged({
    required ConnectivityResult connectionStatus,
  }) : super(connectionStatus: connectionStatus);
}
