import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class ProgramEvent {}

class GetProgramListEvent extends ProgramEvent {}

