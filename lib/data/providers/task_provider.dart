import 'package:api_master_app/data/services/task_service.dart';
import 'package:api_master_app/models/task_model.dart';
import 'package:flutter/material.dart';

class TaskProvider with ChangeNotifier {
  final _taskService = TaskService();
  List<TaskModel> task = [];
  getAll() async {
    var response = await _taskService.listAllTask();
    if (response != null) {
      task = response;
      notifyListeners();
    }
  }

  updateTask(Map<String, String> body, String id) async {
    var response = await _taskService.editById(body, id);
    if (response != null) {
      getAll();
    }
  }

  deleteTask(String id) async {
    var response = await _taskService.deleteById(id);
    if (response != null) {
      getAll();
    }
  }

  TaskProvider() {
    getAll();
  }
}
