import 'package:api_master_app/data/bloc/task_bloc.dart';
import 'package:api_master_app/data/bloc/task_event.dart';
import 'package:api_master_app/data/controllers/task_controller.dart';
import 'package:api_master_app/data/services/http_services.dart';
import 'package:api_master_app/data/services/shared_preferences_service.dart';
import 'package:api_master_app/models/request_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var myHttp = MyHttpClient(Client());
  var shared = SharedPreferencesService();
  var controllerTask = TaskController();
  @override
  Widget build(BuildContext context) {
    final taskBLOC = TaskBloc();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () async {
                  Map<String, String> data = {
                    "email": "example@example.com",
                    "password": "hola123"
                  };
                  await myHttp.post(RequestModel(
                      path: "/api-master/user/signup", body: data));
                },
                child: const Text("Crear usuario")),
            OutlinedButton(
                onPressed: () async {
                  Map<String, String> data = {
                    "email": "example@example.com",
                    "password": "hola123"
                  };
                  var response = await myHttp.post(RequestModel(
                      path: "/api-master/user/signin", body: data));
                  await shared.saveData(StorageTypes.STRING,
                      response?.data["data"]["token"], 'token');
                },
                child: const Text("Iniciar sesion")),
            OutlinedButton(
                onPressed: () async {
                  await myHttp.get(RequestModel(
                      path: "/api-master/task/657d1d3a26ee8a771f5b918e"));
                },
                child: const Text("obtener tarea")),
            OutlinedButton(
                onPressed: () async {
                  Map<String, String> data = {
                    "title": "tarea 1 actualizacion",
                    "description": "crear primer tarea actualizada"
                  };
                  await myHttp.put(RequestModel(
                      path: "/api-master/task/657cc9e310f02303b80721d4",
                      body: data));
                },
                child: const Text("actualizar tarea")),
            OutlinedButton(
                onPressed: () async {
                  await myHttp.del(RequestModel(
                      path: "/api-master/task/657cc9e310f02303b80721d4"));
                },
                child: const Text("eliminar tarea tarea")),
            OutlinedButton(
                onPressed: () async {
                  await TaskController().getAll();
                },
                child: const Text("Listar todas")),
            OutlinedButton(
                onPressed: () {
                  taskBLOC.taskSink.add(ListAllTask());
                },
                child: const Text("Listar todas BLOC")),
            StreamBuilder(
              stream: taskBLOC.taskController,
              builder: (context, snapshot) =>
                  Text(snapshot.data?.length.toString() ?? '0'),
            )
          ],
        ),
      ),
    );
  }
}


/* 
  loacalhost
  3000
  api-master
  localhost:3000/api-master/


  ->EP Usuario
    - Crear Usuarios
    - Iniciar Sesion

  localhost:3000/api-master/user/signup
  localhost:3000/api-master/user/signin

  ->EP Tareas
    - Crear tarea

  localhost:3000/api-master/task/create -> POST TIENE BODY

    - Obtener tareas

  localhost:3000/api-master/task/my-tasks -> GET NO TIENE BODY

    - Actualizar

  localhost:3000/api-master/task/id -> PUT  TIENE BODY
  
    . Eliminar   

  localhost:3000/api-master/task/id -> DELETE NO TIENE BODY



 */