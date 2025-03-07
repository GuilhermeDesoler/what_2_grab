import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_2_grab/config/enviroment/env_loader.dart';
import 'package:what_2_grab/config/firebase/app_firebase.dart';
import 'package:what_2_grab/features/auth/domain/usecases/sign_out.dart';

import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/sign_in.dart';
import 'features/auth/domain/usecases/sign_up.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvLoader().init();
  final appFirebase = await AppFirebase.initialize();

  runApp(
    BlocProvider(
      create: (_) => AuthBloc(
        signIn: SignIn(
          repository: AuthRepositoryImpl(appFirebase: appFirebase),
        ),
        signUp: SignUp(
          repository: AuthRepositoryImpl(appFirebase: appFirebase),
        ),
        signOut: SignOut(
          repository: AuthRepositoryImpl(appFirebase: appFirebase),
        ),
      ),
      child: const MyApp(),
    ),
  );
}
