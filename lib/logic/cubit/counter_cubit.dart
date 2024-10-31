import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:correctflut/constants/enums.dart';
import 'package:correctflut/logic/cubit/internetcubit_cubit.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;

  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0)) {
  }


  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

}
