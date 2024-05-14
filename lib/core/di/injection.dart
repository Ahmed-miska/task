import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/core/errors/failures.dart';
import 'package:task/core/utils/dio_factory.dart';
import 'package:task/data/datasource/remote/dio/api_service.dart';
import 'package:task/data/providers/cat_provider.dart';
import 'package:task/data/providers/login_provider.dart';
import 'package:task/data/repos/category_repo.dart';
import 'package:task/data/repos/login_repo.dart';
import 'package:task/data/repos/save_user_data.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  Dio dio = DioFactory.getDio();
  final sharedPreferences = await SharedPreferences.getInstance();

  /// Services
  getIt.registerLazySingleton(() => dio);
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => ApiService(getIt(), getIt()));
  getIt.registerLazySingleton(() => SaveUserData(sharedPreferences: getIt(), apiService: getIt()));
  getIt.registerLazySingleton(() => Failure);

  /// Providers
  getIt.registerLazySingleton<LoginProvider>(() => LoginProvider(loginRepo: getIt(), saveUserData: getIt()));
  getIt.registerLazySingleton<CategoryProvider>(() => CategoryProvider(getIt()));

  ///repos
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt(), getIt()));
  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt(), getIt()));
}
