

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/responses/product_model.dart';





@immutable
abstract class LessonState {}

class LessonStateInitial extends LessonState {}

class LessonStateLoading extends LessonState {}

class LessonStateSuccess extends LessonState {
  final ProductModel apiModelLesson;

  LessonStateSuccess(this.apiModelLesson);
}

class LessonStateFailed extends LessonState {
  final String error;

  LessonStateFailed(this.error);
}
