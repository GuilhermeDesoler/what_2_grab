import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_2_grab/presentation/pages/design-system/design_system_page.dart';
import 'package:what_2_grab/presentation/pages/home_page.dart';

import 'core/config/service-locator/app_service_locator.dart';
import 'presentation/bloc/auth/auth_bloc.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/sign_up_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = AppServiceLocator.get<AuthBloc>();

    return BlocProvider(
      create: (_) => authBloc,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (_) => LoginPage(),
          '/signup': (_) => SignUpPage(),
          '/home': (_) => HomePage(),
          '/design': (_) => DesignSystemPage(),
        },
      ),
    );
  }
}
