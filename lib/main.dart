import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:what_2_grab/app.dart';
import 'package:what_2_grab/config/env_loader.dart';
import 'package:what_2_grab/config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvLoader().init();
  await Firebase.initializeApp(
    name: 'What2Grab',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
