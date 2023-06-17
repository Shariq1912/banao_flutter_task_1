import 'package:banao_flutter_task_1/blocs/programs_event.dart';
import 'package:banao_flutter_task_1/blocs/programs_state.dart';
import 'package:banao_flutter_task_1/repositories/program_repository.dart';
import 'package:bloc/bloc.dart';

class ProgramsBloc extends Bloc<ProgramEvent, ProgramState> {
  final ProgramsRepository programsRepository;

  ProgramsBloc({required this.programsRepository})
      : super(ProgramStateInitial()) {
    on<GetProgramListEvent>((event, emit) async {
      emit(ProgramStateLoading());
      try {
        final apiModel = await programsRepository.fetchProgramData();
        emit(ProgramStateSuccess(apiModel));
      } catch (e) {
        emit(ProgramStateFailed(e.toString()));
      }
    });
  }
}
