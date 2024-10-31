import 'package:correctflut/constants/enums.dart';
import 'package:correctflut/logic/cubit/internetcubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.title, required this.color});

  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return
   BlocListener<InternetCubit, InternetcubitState>(
  listener: (context, state) {



  },
  child: Scaffold(
      //key: homeScreenKey,
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetcubitState>(
                builder: (context, state) {

              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.WIFI) {
                return const Text('WIFI');
                ;
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.MOBILE) {
                return const Text('MOBILE');
              }else if(state is InternetDisconnected){
                return Container(
                  child: const Text('Disconnected'),
                );
              }else{
                return const CircularProgressIndicator();
              }
            },),

        const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                 const  SnackBar(
                    content: Text('Incremented!'),
                    duration: Duration(milliseconds: 300),
                  );
                  // );
                  // homeScreenKey.currentState.showSnackBar(
                  // );
                } else if (state.wasIncremented == false) {
                  //homeScreenKey.currentState.showSnackBar();
                 const SnackBar(
                    content: Text('Decremented!'),
                    duration: Duration(milliseconds: 300),
                  );
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'BRR, NEGATIVE ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'YAAAY ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'HMM, NUMBER 5',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
              },
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: Text('${widget.title}'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // context.bloc<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: Text('${widget.title} 2nd'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                    // context.bloc<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
           const SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: Colors.redAccent,
              child: const Text(
                'Go to Second Screen',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {


                Navigator.of(context).pushNamed('/second');
              },
            ),
           const  SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: Colors.greenAccent,
              child: const Text(
                'Go to Third Screen',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
            ),
          ],
        ),
      ),
    ),

);
  }
}
