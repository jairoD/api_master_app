import 'package:api_master_app/data/providers/task_provider.dart';
import 'package:api_master_app/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreenProvider extends StatefulWidget {
  final TaskModel task;
  const DetailsScreenProvider({super.key, required this.task});

  @override
  State<DetailsScreenProvider> createState() => _DetailsScreenProviderState();
}

class _DetailsScreenProviderState extends State<DetailsScreenProvider> {
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
      body: Container(
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
                      context.read<TaskProvider>().updateTask({
                        "title": _controllerTitle.value.text,
                        "description": _controllerDesc.value.text
                      }, widget.task.id)
                    },
                child: const Text("Actualizar")),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.transparent)),
                onPressed: () {
                  context.read<TaskProvider>().deleteTask(widget.task.id);
                  Navigator.pop(context);
                },
                child: const Text("Eliminar"))
          ],
        ),
      ),
    );
  }
}
