// ignore_for_file: public_member_api_docs, sort_constructors_first
//EVENTOS
import 'package:api_master_app/data/repositories/task_respository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class TaskBlock2EditEvents {}

class TaskEdit extends TaskBlock2EditEvents {
  final Map<String, String> body;
  final String id;

  TaskEdit({required this.body, required this.id});
}

class TaskDelete extends TaskBlock2EditEvents {
  final String id;

  TaskDelete({required this.id});
}

//ESTADOS
sealed class TaskBlock2EditStates {}

class InitalStateTaskBlocEdit extends TaskBlock2EditStates {}

class LoadingTaskBloc2Edit extends TaskBlock2EditStates {}

class ErrorTaskBloc2Edit extends TaskBlock2EditStates {}

class ErrorTokenEdit extends TaskBlock2EditStates {}

class TaskLoadedkBlocSucces extends TaskBlock2EditStates {}

class TaskBlocEdit extends Bloc<TaskBlock2EditEvents, TaskBlock2EditStates> {
  final TaskRepository _taskRepository;
  TaskBlocEdit(this._taskRepository) : super(InitalStateTaskBlocEdit()) {
    on<TaskEdit>((event, emit) async {
      emit(LoadingTaskBloc2Edit());
      try {
        var response = await _taskRepository.updateTask(event.body, event.id);
        if (response?.statusCode == 401) {
          emit(ErrorTokenEdit());
        }
        if (response?.succes == true && response != null) {
          emit(TaskLoadedkBlocSucces());
        }
      } catch (e) {
        emit(ErrorTaskBloc2Edit());
      }
    });
    on<TaskDelete>((event, emit) async {
      emit(LoadingTaskBloc2Edit());
      try {
        var response = await _taskRepository.deleteTask(event.id);
        if (response?.statusCode == 401) {
          emit(ErrorTokenEdit());
        }
        if (response?.succes == true && response != null) {
          emit(TaskLoadedkBlocSucces());
        }
      } catch (e) {
        emit(ErrorTaskBloc2Edit());
      }
    });
  }
}
