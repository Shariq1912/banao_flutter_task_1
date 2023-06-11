import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

inject() async {
  await _registerSingleton();
  _registerBlocs();
}

_registerSingleton() async {
  /*final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton(prefs);*/

  _registerRepositories();
}

void _registerRepositories() {}

void _registerBlocs() {}
