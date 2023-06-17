import 'package:banao_flutter_task_1/blocs/lesson/lesson_bloc.dart';
import 'package:banao_flutter_task_1/blocs/programs_bloc.dart';
import 'package:banao_flutter_task_1/repositories/lesson_repository.dart';
import 'package:banao_flutter_task_1/repositories/program_repository.dart';
import 'package:get_it/get_it.dart';

import 'networks/dio_client.dart';

final getIt = GetIt.instance;

inject() async {
  await _registerSingleton();
  _registerBlocs();
}

_registerSingleton() async {
  getIt.registerSingleton(DioClient());
  _registerRepositories();
}

void _registerRepositories() {
  getIt.registerSingleton(ProgramsRepository(dioClient: getIt()));
  getIt.registerSingleton(LessonRepository(dioClient: getIt()));
}

void _registerBlocs() {
  getIt.registerFactory(() => ProgramsBloc(programsRepository:getIt()));
  getIt.registerFactory(() => LessonBloc(lessonRepository:getIt()));
}
