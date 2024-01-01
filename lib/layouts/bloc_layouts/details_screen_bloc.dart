import 'package:api_master_app/data/bloc/task_bloc_edit.dart';
import 'package:api_master_app/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreenBLOC extends StatefulWidget {
  final TaskModel task;
  const DetailsScreenBLOC({super.key, required this.task});

  @override
  State<DetailsScreenBLOC> createState() => _DetailsScreenProviderState();
}

class _DetailsScreenProviderState extends State<DetailsScreenBLOC> {
  late TextEditingController _controllerTitle;
  late TextEditingController _controllerDesc;

  @override
  void initState() {
    super.initState();
    _controllerTitle = TextEditingController(text: widget.task.title);
    _controllerDesc = TextEditingController(text: widget.task.description);
  }

  @override
  void dispose() {
    _controllerTitle.dispose();
    _controllerDesc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext asdcontext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task.id),
      ),
      body: BlocConsumer<TaskBlocEdit, TaskBlock2EditStates>(
        listener: (context, state) {
          if (state is TaskLoadedkBlocSucces) {
            Navigator.of(context, rootNavigator: true).pop();
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Accion realizada')));
            //context.read<TaskBloc2>().add(LoadAllTask());
          }
          if (state is ErrorTaskBloc2Edit) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Error al realizar accion')));
          }
          if (state is ErrorTokenEdit) {
            {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('La sesion expiro')));
            }
          }
          if (state is LoadingTaskBloc2Edit) {
            showDialog(
              context: context,
              barrierDismissible: false, // Hace que el diálogo no sea cerrable.
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
            );
          } else {
            if (Navigator.of(context, rootNavigator: true).canPop()) {
              Navigator.of(context, rootNavigator: true).pop();
            }
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
                  controller: _controllerTitle,
                ),
                SizedBox(height: 20),
                Expanded(
                    child: TextField(
                  expands: true,
                  minLines: null,
                  maxLines: null,
                  controller: _controllerDesc,
                )),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.transparent)),
                    onPressed: () => {
                          /* {
                            "title": _controllerTitle.value.text,
                            "description": _controllerDesc.value.text
                          }, widget.task.id */
                          context.read<TaskBlocEdit>().add(TaskEdit(body: {
                                "title": _controllerTitle.value.text,
                                "description": _controllerDesc.value.text
                              }, id: widget.task.id))
                        },
                    child: const Text("Actualizar")),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.transparent)),
                    onPressed: () {
                      context
                          .read<TaskBlocEdit>()
                          .add(TaskDelete(id: widget.task.id));
                    },
                    child: const Text("Eliminar"))
              ],
            ),
          );
        },
      ),
    );
  }
}
