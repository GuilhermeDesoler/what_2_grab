import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_2_grab/core/config/enviroment/env_loader.dart';
import 'package:what_2_grab/core/config/firebase/app_firebase.dart';
import 'package:what_2_grab/domain/usecases/sign_out.dart';

import 'data/repositories/auth_repository_impl.dart';
import 'domain/usecases/sign_in.dart';
import 'domain/usecases/sign_up.dart';
import 'presentation/bloc/auth_bloc.dart';
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
