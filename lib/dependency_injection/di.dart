import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasource/local/shared_preference_manager.dart';
import '../data/datasource/remote/service/network_api_service.dart';
import '../utils/res/Api/api_client.dart';
import '../utils/res/constants.dart';
import '../utils/res/endpoints.dart';


final sl = GetIt.instance;

Future<void> setupDependency()async{
  sl.registerLazySingleton<AppConstants>(() => AppConstants());
  sl.registerLazySingletonAsync<SharedPreferences>(() => SharedPreferences.getInstance());
  await sl.isReady<SharedPreferences>();
  sl.registerLazySingleton<SharedPreferenceManager>(() => SharedPreferenceManager());
  sl.registerLazySingleton<ApiClient>(() => ApiClient());
  sl.registerLazySingleton<EndPoints>(() => EndPoints());
  sl.registerLazySingleton<ApiService>(() => ApiService());
}