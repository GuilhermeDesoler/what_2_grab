import 'package:flutter/material.dart';
import 'package:what_2_grab/presentation/pages/home_page.dart';

import 'presentation/pages/login_page.dart';
import 'presentation/pages/sign_up_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
