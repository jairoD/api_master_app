import 'package:api_master_app/data/bloc/task_bloc2.dart';
import 'package:api_master_app/data/bloc/task_bloc_edit.dart';
import 'package:api_master_app/data/repositories/task_respository.dart';
import 'package:api_master_app/layouts/login.dart';
import 'package:api_master_app/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//PROVIDER
/* Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => TaskProvider())],
    child: MyApp(),
  ));
} */
//BLOC
Future<void> main() async {
  setup();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskBloc2>(
          create: (context) =>
              TaskBloc2(getIt<TaskRepository>())..add(LoadAllTask()),
        ),
        BlocProvider<TaskBlocEdit>(
          create: (context) => TaskBlocEdit(getIt<TaskRepository>()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Login(),
      ),
    );
  }
}
