import 'baseConfig.dart';

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String varient1 = 'varient1';
  static const String varient2 = 'varient2';

  late BaseConfig config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.varient1:
        return Varient1Config();
      default:
        return Varient2Config();
    }
  }
}