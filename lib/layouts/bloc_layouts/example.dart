import 'package:api_master_app/data/bloc/task_bloc2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskBloc2, TaskBlock2States>(
        builder: (context, state) => Center(child: Text(state.toString())),
      ),
    );
  }
}
