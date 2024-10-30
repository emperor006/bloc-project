import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:correctflut/constants/enums.dart';
import 'package:correctflut/logic/cubit/internetcubit_cubit.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetSubscriptionStream;

  CounterCubit({required this.internetCubit}) : super(CounterState(counterValue: 0)){
    monitorInternetConnection();
  }

  void monitorInternetConnection() {
     internetSubscriptionStream=internetCubit.stream.listen((internetState){
      if(internetState is InternetConnected && internetState.connectionType==ConnectionType.MOBILE){
    increment();
      }else if(internetState is InternetConnected && internetState.connectionType==ConnectionType.WIFI){
    decrement();
      }
    });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  Future<void> close() {
    // TODO: implement close
    internetSubscriptionStream.cancel();
    return super.close();
  }


}
