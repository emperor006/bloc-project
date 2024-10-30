import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:correctflut/constants/enums.dart';
import 'package:meta/meta.dart';

part 'internetcubit_state.dart';

class InternetCubit extends Cubit<InternetcubitState> {

  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()){
    connectivityStreamSubscription=connectivity.onConnectivityChanged.listen((connectivityResult){
      if(connectivityResult.first==ConnectivityResult.wifi){
       emitInternetConnected(ConnectionType.WIFI);
      }else if(connectivityResult.first==ConnectivityResult.mobile){
        emitInternetConnected(ConnectionType.MOBILE);
      }else{
       emitInternetDisconnected();
      }

    });
  }

  @override
  Future<void> close() {
    // TODO: implement close|
    connectivityStreamSubscription.cancel();
    return super.close();
  }

  void emitInternetConnected(ConnectionType _connectionType)=>emit(InternetConnected(connectionType: _connectionType));

  void emitInternetDisconnected()=>emit(InternetDisconnected());



}
