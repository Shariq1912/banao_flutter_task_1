import 'package:banao_flutter_task_1/blocs/lesson/lesson_event.dart';
import 'package:banao_flutter_task_1/blocs/lesson/lesson_state.dart';
import 'package:banao_flutter_task_1/repositories/lesson_repository.dart';
import 'package:bloc/bloc.dart';


class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LessonRepository lessonRepository;

  LessonBloc({required this.lessonRepository})
      : super(LessonStateInitial()) {
    on<GetLessonsListEvent>((event, emit) async {
      emit(LessonStateLoading());
      try {
        final apiModel = await lessonRepository.fetchLessonsData();
        emit(LessonStateSuccess(apiModel));
      } catch (e) {
        emit(LessonStateFailed(e.toString()));
      }
    });
  }
}
