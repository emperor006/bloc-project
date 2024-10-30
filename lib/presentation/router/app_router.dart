import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';
import '../screens/home_screen.dart';
import '../screens/second_screen.dart';
import '../screens/third_screen.dart';


class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();


  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>
          BlocProvider<CounterCubit>.value(
            value: _counterCubit,
            child: HomeScreen(
              title: "Home Screen",
              color: Colors.blueAccent,
            ),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) =>
          BlocProvider<CounterCubit>.value(
            value: _counterCubit,
            child: SecondScreen(
              title: "Second Screen",
              color: Colors.redAccent,
            ),
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) =>
          BlocProvider<CounterCubit>.value(
                value: _counterCubit,
                child: ThirdScreen(
                  title: "Thirst Screen",
                  color: Colors.greenAccent,
                ),
              ),
        );
      default:
        return null;
    }
  }
  void dispose(){
    _counterCubit.close();
  }
}



