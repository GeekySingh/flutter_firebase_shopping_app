
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

final locator = GetIt.instance..allowReassignment = true;

@injectableInit
void setupLocator() {
  _init(locator);
  $initGetIt(locator);
}

void _init(GetIt locator) {

  _registerNetworkModules(locator);
}

void _registerNetworkModules(GetIt locator) {

  locator.registerSingleton<Dio>(Dio());
}