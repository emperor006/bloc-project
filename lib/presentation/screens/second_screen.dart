import 'package:correctflut/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({
    //Key key,
    required this.title,
    required this.color,
    //required this.homeScreenKey,
  //  required this.homeScreenKey,
  });

  final String title;
  final Color color;
  //final GlobalKey<ScaffoldState> homeScreenKey;

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  //GlobalKey<ScaffoldState> secondScreenKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: secondScreenKey,
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {

                const SnackBar(
                    content: Text('Incremented!'),
                    duration: Duration(milliseconds: 300),
                  );
                //  widget.homeScreenKey.currentState.removeCurrentSnackBar();
                //   secondScreenKey.currentState.showSnackBar(
                //     SnackBar(
                //       content: Text('Incremented!'),
                //       duration: Duration(milliseconds: 300),
                //     ),
                //   );
                } else if (state.wasIncremented == false) {
                  const SnackBar(
                    content: Text('Decremented!'),
                    duration: Duration(milliseconds: 300),
                  );

                  // widget.homeScreenKey.currentState.removeCurrentSnackBar();
                  // secondScreenKey.currentState.removeCurrentSnackBar();
                  // Scaffold.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text('Decremented!'),
                  //     duration: Duration(milliseconds: 300),
                  //   ),
                  // );
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
                  backgroundColor: widget.color,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // context.bloc<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  backgroundColor: widget.color,
                  heroTag: Text('${widget.title} 2nd'),
                  onPressed: () {
                     BlocProvider.of<CounterCubit>(context).increment();
                    //context.bloc<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child:const Icon(Icons.add),
                ),
              ],
            ),
           const SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: Colors.greenAccent,
              child:const Text(
                'Go to Third Screen',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
             //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ThirdScreen(title: 'Third screen', color: Colors.green,)));
                Navigator.of(context).pushNamed('/third');
              },
            ),
          ],
        ),
      ),
    );
  }
}
