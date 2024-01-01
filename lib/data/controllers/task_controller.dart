import 'package:api_master_app/data/services/task_service.dart';
import 'package:api_master_app/models/task_model.dart';

class TaskController {
  final taskService = TaskService();
  List<TaskModel> task = [];

  getAll() async {
    var response = await taskService.listAllTask();
    if (response != null) {
      task = response;
    }
  }
}
