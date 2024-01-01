import 'package:api_master_app/data/repositories/task_respository.dart';
import 'package:api_master_app/data/services/http_services.dart';
import 'package:api_master_app/data/services/shared_preferences_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<Client>(() => Client());
  getIt.registerLazySingleton<SharedPreferencesService>(
      () => SharedPreferencesService());
  getIt.registerLazySingleton<MyHttpClient>(() => MyHttpClient(Client()));
  getIt.registerLazySingleton<TaskRepository>(() => TaskRepository());
}
