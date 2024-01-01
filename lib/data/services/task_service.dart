import 'package:api_master_app/data/repositories/task_respository.dart';
import 'package:api_master_app/models/response_model.dart';
import 'package:api_master_app/models/task_model.dart';

class TaskService {
  Future<List<TaskModel>?> listAllTask() async {
    try {
      final ResponseModel? res = await TaskRepository().listAllTask();
      if (res != null) {
        List<dynamic> aux = res.data["response"];
        return aux.map((e) => TaskModel.fromMap(e)).toList();
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<TaskModel?> listById(String id) async {
    try {
      final ResponseModel? res = await TaskRepository().listById(id);
      if (res != null) {
        Map<String, String> aux = res.data["data"];
        return TaskModel.fromMap(aux);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<TaskModel?> deleteById(String id) async {
    try {
      final ResponseModel? res = await TaskRepository().deleteTask(id);
      if (res != null) {
        Map<String, dynamic> aux = res.data["response"];
        return TaskModel.fromMap(aux);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<TaskModel?> editById(Map<String, String> body, String id) async {
    try {
      final ResponseModel? res = await TaskRepository().updateTask(body, id);
      if (res != null) {
        Map<String, dynamic> aux = res.data["data"];
        return TaskModel.fromMap(aux);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
