import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvLoader {
  static final EnvLoader _instance = EnvLoader._internal();

  factory EnvLoader() {
    return _instance;
  }

  EnvLoader._internal();

  String get(String key) {
    return dotenv.env[key] ?? '';
  }

  static List<String> get _listKeys => dotenv.env.keys.toList();

  void areKeysValid(List<String> requiredKeys) {
    for (var key in requiredKeys) {
      if (dotenv.env[key] == null) {
        throw Exception('Chave ausente: $key');
      }
    }
  }

  Future<void> init() async {
    try {
      await dotenv.load(fileName: ".env");
      areKeysValid(_listKeys);
      debugPrint('Arquivo .env carregado com sucesso!');
    } catch (e) {
      debugPrint('Erro ao carregar o arquivo .env: $e');
    }
  }
}
