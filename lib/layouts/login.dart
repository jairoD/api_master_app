import 'package:api_master_app/data/bloc/task_bloc2.dart';
import 'package:api_master_app/layouts/bloc_layouts/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: OutlinedButton(
              onPressed: () async {
                /* Map<String, String> data = {
                  "email": "example@example.com",
                  "password": "hola123"
                };
                var response = await getIt<MyHttpClient>().post(
                    RequestModel(path: "/api-master/user/signin", body: data));

                await getIt<SharedPreferencesService>().saveData(
                    StorageTypes.STRING,
                    response?.data["data"]["token"],
                    'token');

                if (response?.statusCode == 200) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => HomeScreenBloc(),
                  ));
                } */
                final bloc = context.read<TaskBloc2>();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => BlocProvider<TaskBloc2>.value(
                    value: bloc,
                    child: const HomeScreenBloc(),
                  ),
                ));
              },
              child: Text('Iniciar sesion'))),
    );
  }
}
