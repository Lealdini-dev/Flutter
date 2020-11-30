import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

abstract class Env {
  static const String dev = 'dev';
  static const String prod = 'prod';
}

final getIt = GetIt.instance;

@InjectableInit()
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}