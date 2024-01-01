// ignore_for_file: public_member_api_docs, sort_constructors_first
//EVENTOS
import 'package:api_master_app/data/repositories/task_respository.dart';
import 'package:api_master_app/models/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class TaskBlock2Events {}

class LoadAllTask extends TaskBlock2Events {}

class ExampleTask extends TaskBlock2Events {}

//ESTADOS
class TaskBlock2States {}

class InitalStateTaskBloc2 extends TaskBlock2States {}

class LoadingTaskBloc2 extends TaskBlock2States {}

class ErrorTaskBloc2 extends TaskBlock2States {}

class ErrorToken extends TaskBlock2States {}

class TaskLoadedkBloc2 extends TaskBlock2States {
  List<TaskModel> list;
  TaskLoadedkBloc2({
    required this.list,
  });
}

class TaskBloc2 extends Bloc<TaskBlock2Events, TaskBlock2States> {
  final TaskRepository taskRepository;
  TaskBloc2(this.taskRepository) : super(InitalStateTaskBloc2()) {
    on<LoadAllTask>((event, emit) async {
      /* emit(LoadingTaskBloc2());
      try {
        var response = await taskRepository.listAllTask();
        if (response?.statusCode == 401) {
          emit(ErrorToken());
          return;
        }
        if (response?.succes == true && response != null) {
          List<dynamic> aux = response.data["response"];
          emit(TaskLoadedkBlock2(
              list: aux.map((e) => TaskModel.fromMap(e)).toList()));
          return;
        }
        emit(ErrorTaskBloc2());
        return;
      } catch (e) {
        emit(ErrorTaskBloc2());
      } */
      emit(LoadingTaskBloc2());
    });
    on<ExampleTask>((event, emit) async {
      /* emit(LoadingTaskBloc2());
      try {
        var response = await taskRepository.listAllTask();
        if (response?.statusCode == 401) {
          emit(ErrorToken());
          return;
        }
        if (response?.succes == true && response != null) {
          List<dynamic> aux = response.data["response"];
          emit(TaskLoadedkBlock2(
              list: aux.map((e) => TaskModel.fromMap(e)).toList()));
          return;
        }
        emit(ErrorTaskBloc2());
        return;
      } catch (e) {
        emit(ErrorTaskBloc2());
      } */
      emit(TaskLoadedkBloc2(list: []));
    });
  }
}
