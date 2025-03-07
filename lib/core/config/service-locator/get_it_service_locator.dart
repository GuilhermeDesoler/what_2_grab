import 'package:get_it/get_it.dart';

import 'service_locator.dart';

class GetItServiceLocator implements ServiceLocator {
  final GetIt _instance = GetIt.instance;

  @override
  void registerSingleton<T extends Object>(T instance) {
    _instance.registerSingleton<T>(instance);
  }

  @override
  void registerLazySingleton<T extends Object>(T Function() factory) {
    _instance.registerLazySingleton<T>(factory);
  }

  @override
  void registerFactory<T extends Object>(T Function() factory) {
    _instance.registerFactory<T>(factory);
  }

  @override
  T get<T extends Object>() {
    return _instance<T>();
  }
}
