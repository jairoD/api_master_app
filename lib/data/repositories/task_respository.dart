import 'package:api_master_app/data/services/http_services.dart';
import 'package:api_master_app/models/request_model.dart';
import 'package:api_master_app/models/response_model.dart';
import 'package:api_master_app/setup.dart';

class TaskRepository {
  final _service = getIt<MyHttpClient>();

  Future<ResponseModel?> listAllTask() async {
    try {
      return await _service
          .get(RequestModel(path: '/api-master/task/my-tasks'));
    } catch (e) {
      return null;
    }
  }

  Future<ResponseModel?> listById(String id) async {
    try {
      return await _service.get(RequestModel(path: '/api-master/task/$id'));
    } catch (e) {
      return null;
    }
  }

  Future<ResponseModel?> postTask(Map<String, String> myBody) async {
    try {
      return await _service.post(RequestModel(
          path: '/api-master/task', method: HTTPMethods.POST, body: myBody));
    } catch (e) {
      return null;
    }
  }

  Future<ResponseModel?> updateTask(
      Map<String, String> myBody, String id) async {
    try {
      return await _service.put(RequestModel(
          path: '/api-master/task/$id', method: HTTPMethods.PUT, body: myBody));
    } catch (e) {
      return null;
    }
  }

  Future<ResponseModel?> deleteTask(String id) async {
    try {
      return await _service.del(
          RequestModel(path: '/api-master/task/$id', method: HTTPMethods.GET));
    } catch (e) {
      return null;
    }
  }
}
