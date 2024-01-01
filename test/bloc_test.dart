import 'package:api_master_app/data/bloc/task_bloc2.dart';
import 'package:api_master_app/data/repositories/task_respository.dart';
import 'package:api_master_app/main.dart';
import 'package:api_master_app/models/response_model.dart';
import 'package:api_master_app/setup.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'bloc_test.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  setUpAll(() {
    dotenv.testLoad();
  });
  group("Testing BLOC", () {
    MockTaskRepository mockTaskRepository = MockTaskRepository();
    TaskBloc2 taskBloc = TaskBloc2(mockTaskRepository);

    blocTest(
      'emits [MyState] when MyEvent is added.',
      build: () => taskBloc,
      act: (bloc) => bloc.add(ExampleTask()),
      expect: () => [isA<TaskLoadedkBloc2>()],
    );

    testWidgets("Testing widgets bloc", (widgetTester) async {
      setup();
      when(mockTaskRepository.listAllTask()).thenAnswer(
          (realInvocation) async => ResponseModel(
              data: {"response": []},
              message: 'fetched data',
              statusCode: 200,
              succes: true));
      await widgetTester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<TaskBloc2>(
            create: (context) => taskBloc,
          ),
        ],
        child: const MyApp(),
      ));
      await widgetTester.pumpAndSettle();
      final initTest = find.text('Iniciar sesion');
      expect(initTest, findsOneWidget);
      await widgetTester.tap(find.byType(OutlinedButton));
      await widgetTester.pumpAndSettle();
      final loading = find.text('cargando...');
      expect(loading, findsOneWidget);
      await widgetTester.pumpAndSettle();
      await widgetTester.tap(find.byType(FloatingActionButton));
      await widgetTester.pumpAndSettle();
      final loaded = find.text('Loaded');
      expect(loaded, findsOneWidget);
    });
  });
}
