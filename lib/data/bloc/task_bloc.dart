import 'dart:async';

import 'package:api_master_app/data/bloc/task_event.dart';
import 'package:api_master_app/data/services/task_service.dart';
import 'package:api_master_app/models/task_model.dart';

class TaskBloc {
  final _taskService = TaskService();
  final _taskController = StreamController<List<TaskModel>>();
  Stream<List<TaskModel>> get taskController => _taskController.stream;

  final _taskEventController = StreamController<TaskEvents>();
  Sink<TaskEvents> get taskSink => _taskEventController.sink;

  TaskBloc() {
    _taskEventController.stream.listen(_mapEventToState);
  }

  _mapEventToState(TaskEvents events) async {
    if (events is ListAllTask) {
      final response = await _taskService.listAllTask();
      _taskController.add(response ?? []);
    } else {
      _taskController.add([]);
    }
  }
}
