import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'countercubit_state.dart';

class CountercubitCubit extends Cubit<CountercubitState> {
  CountercubitCubit() : super(CountercubitState(counterValue: 0, wasIncremented: false));

  void increement()=>emit(CountercubitState(counterValue: state.counterValue+1, wasIncremented: true));
  void decreement()=>emit(CountercubitState(counterValue: state.counterValue-1, wasIncremented: false));

}
