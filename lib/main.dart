import 'package:flutter/material.dart';
import 'package:what_2_grab/core/config/enviroment/env_loader.dart';
import 'package:what_2_grab/core/config/firebase/app_firebase.dart';

import 'core/config/service-locator/app_service_locator.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvLoader().init();
  await AppFirebase.initialize();
  AppServiceLocator.init();

  runApp(
    const MyApp(),
  );
}
