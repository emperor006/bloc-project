import 'package:correctflut/presentation/router/app_router.dart';
import 'package:correctflut/presentation/screens/home_screen.dart';
import 'package:correctflut/presentation/screens/second_screen.dart';
import 'package:correctflut/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();
  final AppRouter appRouter= AppRouter();

  @override
  void dispose() {
    _counterCubit.close();
    // TODO: implement dispose
    super.dispose();
  }

  //const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      onGenerateRoute: appRouter.onGenerateRoute,
      routes: {
        '/': (context) => BlocProvider<CounterCubit>.value(
              value:  _counterCubit,
              child: HomeScreen(
                title: 'Home Screen',
                color: Colors.blue,
              ),
            ),
        '/second': (context) => BlocProvider<CounterCubit>.value(
              value:  _counterCubit,
              child: SecondScreen(
                title: 'Second Screen',
                color: Colors.green,
              ),
            ),
        '/third': (context) => BlocProvider<CounterCubit>.value(
              value: _counterCubit,
              child: ThirdScreen(
                title: 'Third Screen',
                color: Colors.red,
              ),
            )
      },
    );
  }
}
