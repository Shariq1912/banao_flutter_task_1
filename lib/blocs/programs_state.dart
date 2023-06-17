

import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/responses/programs_response.dart';


@immutable
abstract class ProgramState {}

class ProgramStateInitial extends ProgramState {}

class ProgramStateLoading extends ProgramState {}

class ProgramStateSuccess extends ProgramState {
  final ApiModel apiModel;

  ProgramStateSuccess(this.apiModel);
}

class ProgramStateFailed extends ProgramState {
  final String error;

  ProgramStateFailed(this.error);
}