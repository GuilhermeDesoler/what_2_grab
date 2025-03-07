import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'firebase_options.dart';

class AppFirebase {
  AppFirebase({required this.firebaseAuth});

  final FirebaseAuth firebaseAuth;

  static Future<AppFirebase> initialize() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final firebaseAuth = FirebaseAuth.instance;
      debugPrint('Firebase Inicializado com Sucesso!');
      return AppFirebase(firebaseAuth: firebaseAuth);
    } catch (e) {
      debugPrint('Erro ao inicializar o Firebase: $e');
      rethrow;
    }
  }
}
