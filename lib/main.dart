import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//----Cubit

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  incrementar() {
    emit(state + 1);
  }
}
//--------

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider( // Envolvendo o widget para poder instanciar o cubit
        create: (context) => CounterCubit(),
        child: MyHomePage(title: 'Flutter Demo Home Page'), // classe herdeira do cubit
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, int>(  // função que atualiza o estado quando houver mudança
              builder: (context, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<CounterCubit>(context).incrementar(); // função estática que permite acessar a instância da classe fornecida pelo Provider
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
