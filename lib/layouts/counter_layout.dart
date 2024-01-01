import 'package:api_master_app/data/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterLayout extends StatelessWidget {
  CounterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLOC COUNTER')),
      body: BlocConsumer<CounterBloc, int>(
        listener: (context, state) => {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Ser realizo funcion')))
        },
        builder: (context, counter) {
          return Center(
            child: Text('$counter'),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 'plus',
              child: const Icon(Icons.add),
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterIncrement())),
          FloatingActionButton(
              heroTag: 'remove',
              child: const Icon(Icons.remove),
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterDecrement()))
        ],
      ),
    );
  }
}
