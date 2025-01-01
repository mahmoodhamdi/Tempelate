import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tempelate/core/network/dio_client.dart';


final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Register SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Services
  sl.registerSingleton<DioClient>(DioClient());
}
