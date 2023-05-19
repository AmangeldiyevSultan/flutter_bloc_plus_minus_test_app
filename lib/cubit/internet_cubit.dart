import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_plus_minus_test_app/constants/enum.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        emitConnectedInternet(ConnectivityType.wifi);
      } else if (connectivityResult == ConnectivityResult.mobile) {
        emitConnectedInternet(ConnectivityType.mobiles);
      } else {
        emitDisonnectedInternet();
      }
    });
  }

  void emitConnectedInternet(ConnectivityType connectivityType) =>
      emit(InternetConnected(connectivityType: connectivityType));

  void emitDisonnectedInternet() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription!.cancel();
    return super.close();
  }
}
