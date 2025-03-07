import 'package:firebase_auth/firebase_auth.dart';
import 'package:what_2_grab/core/config/firebase/app_firebase.dart';
import 'package:what_2_grab/data/repositories/auth_repository_impl.dart';
import 'package:what_2_grab/domain/usecases/sign_in.dart';
import 'package:what_2_grab/domain/usecases/sign_out.dart';
import 'package:what_2_grab/domain/usecases/sign_up.dart';
import 'package:what_2_grab/presentation/bloc/auth/auth_bloc.dart';

import '../../../domain/repositories/auth_respository.dart';
import 'get_it_service_locator.dart';
import 'service_locator.dart';

class AppServiceLocator {
  static final ServiceLocator _instance = GetItServiceLocator();

  static void init() {
    _instance.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

    _instance.registerLazySingleton<AppFirebase>(
        () => AppFirebase(firebaseAuth: _instance.get()));

    // REPOSITORIES
    _instance.registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(appFirebase: _instance.get()));

    // USECASES
    _instance
        .registerFactory<SignIn>(() => SignIn(repository: _instance.get()));
    _instance
        .registerFactory<SignUp>(() => SignUp(repository: _instance.get()));
    _instance
        .registerFactory<SignOut>(() => SignOut(repository: _instance.get()));

    // BLOCS
    _instance.registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        signIn: _instance.get(),
        signUp: _instance.get(),
        signOut: _instance.get(),
      ),
    );
  }

  static T get<T extends Object>() {
    return _instance.get<T>();
  }
}
