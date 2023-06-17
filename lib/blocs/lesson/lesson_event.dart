

import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class LessonEvent {}

class GetLessonsListEvent extends LessonEvent {}
