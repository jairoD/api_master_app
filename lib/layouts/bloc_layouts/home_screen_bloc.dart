import 'package:api_master_app/data/bloc/task_bloc2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenBloc extends StatelessWidget {
  const HomeScreenBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLOC task')),
      body: BlocConsumer<TaskBloc2, TaskBlock2States>(
        bloc: BlocProvider.of<TaskBloc2>(context),
        listener: (context, state) => {
          /* if (state is InitalStateTaskBloc2)
            {
              showDialog(
                context: context,
                barrierDismissible:
                    false, // Hace que el diálogo no sea cerrable.
                builder: (context) {
                  return const Dialog(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(width: 20),
                          Text("Cargando..."),
                        ],
                      ),
                    ),
                  );
                },
              )
            },
          if (state is ErrorTaskBloc2)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Error al obtener tareas')))
            },
          if (state is ErrorToken)
            {
              {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('La sesion expiro')))
              },
            },
          if (state is LoadingTaskBloc2)
            {
              showDialog(
                context: context,
                barrierDismissible:
                    false, // Hace que el diálogo no sea cerrable.
                builder: (context) {
                  return const Dialog(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(width: 20),
                          Text("Cargando..."),
                        ],
                      ),
                    ),
                  );
                },
              )
            }
          else
            {
              if (Navigator.of(context, rootNavigator: true).canPop())
                {Navigator.of(context, rootNavigator: true).pop()}
            } */
        },
        builder: (context, state) {
          if (state is TaskLoadedkBloc2) {
            return const Center(
              child: Text('Loaded'),
            );
          }
          if (state is LoadingTaskBloc2) {
            return const Center(
              child: Text('cargando...'),
            );
          }
          return Center(
            child: FloatingActionButton(
                onPressed: () => context.read<TaskBloc2>().add(LoadAllTask())),
          );
          /* if (state is TaskLoadedkBlock2) {
            return const Center(child: Text('Success'));
            /* return ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.list.length,
              itemBuilder: (context, index) => ListTile(
                  trailing: IconButton(
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreenBLOC(task: state.list[index]),
                          )),
                      icon: const Icon(Icons.arrow_right_outlined)),
                  title: Text(
                    state.list[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  )),
            ); */
          } else if (state is InitalStateTaskBloc2) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorToken) {
            return const Center(child: Text('Error'));
          } else if (state is ErrorTaskBloc2) {
            return const Center(child: Text('Error task'));
          } else {
            return Center(child: Text(state.toString()));
          } */
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 'plus',
              child: const Icon(Icons.add),
              onPressed: () {
                final bloc = context.read<TaskBloc2>();
                bloc.add(ExampleTask());
              }),
        ],
      ),
    );
  }
}
