import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvLoader {
  static final EnvLoader _instance = EnvLoader._internal();

  factory EnvLoader() {
    return _instance;
  }

  EnvLoader._internal();

  Future<void> init() async {
    try {
      await dotenv.load(fileName: ".env");
      debugPrint('Arquivo .env carregado com sucesso!');
    } catch (e) {
      debugPrint('Erro ao carregar o arquivo .env: $e');
    }
  }

  String? get(String key) {
    return dotenv.env[key];
  }

  List<String> listKeys() {
    return dotenv.env.keys.toList();
  }

  bool areKeysValid(List<String> requiredKeys) {
    for (var key in requiredKeys) {
      if (dotenv.env[key] == null) {
        print('Chave ausente: $key');
        return false;
      }
    }
    return true;
  }
}
