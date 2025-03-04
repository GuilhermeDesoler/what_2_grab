// ignore_for_file: non_constant_identifier_names

import 'package:what_2_grab/config/env_loader.dart';

class EnvKeyValues {
  static get API_KEY_WEB => EnvLoader().get('API_KEY_WEB');
  static get APP_ID_WEB => EnvLoader().get('APP_ID_WEB');
  static get MESSAGING_SENDER_ID => EnvLoader().get('MESSAGING_SENDER_ID');
  static get PROJECT_ID => EnvLoader().get('PROJECT_ID');
  static get AUTH_DOMAIN => EnvLoader().get('AUTH_DOMAIN');
  static get STORAGE_BUCKET => EnvLoader().get('STORAGE_BUCKET');
  static get MEASUREMENT_ID => EnvLoader().get('MEASUREMENT_ID');
  static get API_KEY_ANDROID => EnvLoader().get('API_KEY_ANDROID');
  static get APP_ID_ANDROID => EnvLoader().get('APP_ID_ANDROID');
  static get API_KEY_IOS => EnvLoader().get('API_KEY_IOS');
  static get APP_ID_IOS => EnvLoader().get('APP_ID_IOS');
  static get IOS_BUNDLE_ID => EnvLoader().get('IOS_BUNDLE_ID');
}
