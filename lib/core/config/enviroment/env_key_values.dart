// ignore_for_file: non_constant_identifier_names

import 'package:what_2_grab/core/config/enviroment/env_loader.dart';

class EnvKeyValues {
  String get API_KEY_WEB => EnvLoader().get('API_KEY_WEB');
  String get APP_ID_WEB => EnvLoader().get('APP_ID_WEB');
  String get MESSAGING_SENDER_ID => EnvLoader().get('MESSAGING_SENDER_ID');
  String get PROJECT_ID => EnvLoader().get('PROJECT_ID');
  String get AUTH_DOMAIN => EnvLoader().get('AUTH_DOMAIN');
  String get STORAGE_BUCKET => EnvLoader().get('STORAGE_BUCKET');
  String get MEASUREMENT_ID => EnvLoader().get('MEASUREMENT_ID');
  String get API_KEY_ANDROID => EnvLoader().get('API_KEY_ANDROID');
  String get APP_ID_ANDROID => EnvLoader().get('APP_ID_ANDROID');
  String get API_KEY_IOS => EnvLoader().get('API_KEY_IOS');
  String get APP_ID_IOS => EnvLoader().get('APP_ID_IOS');
  String get IOS_CLIENT_ID => EnvLoader().get('IOS_CLIENT_ID');
  String get IOS_BUNDLE_ID => EnvLoader().get('IOS_BUNDLE_ID');
}
