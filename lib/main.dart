import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/countercubit_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountercubitCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CountercubitCubit, CountercubitState>(
                builder: (context, state) {
                  return Text(
                    '${state.counterValue}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  );
                },
               // listener: (BuildContext context, CountercubitState state) {
                  listener: (context, state) {
                    // TODO: implement listener
                    if(state.wasIncremented==true){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Increement'), duration: Duration(milliseconds: 300),));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Decreement'), duration: Duration(milliseconds: 300),));
                    }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(onPressed: () {
                    BlocProvider.of<CountercubitCubit>(context).increement();
                  }, tooltip: "Increment", child: Icon(Icons.add),),
                  SizedBox(width: 50,),

                  FloatingActionButton(onPressed: () {
                    BlocProvider.of<CountercubitCubit>(context).decreement();
                  }, tooltip: "Decrement", child: Icon(Icons.remove,)

                  )
                ],)

            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
