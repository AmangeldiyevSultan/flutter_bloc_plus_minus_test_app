part of 'internet_cubit.dart';

abstract class InternetState {
  const InternetState();
}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectivityType connectivityType;
  const InternetConnected({required this.connectivityType});
}

class InternetDisconnected extends InternetState {}
