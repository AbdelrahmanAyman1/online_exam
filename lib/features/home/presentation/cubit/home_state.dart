import '../../domain/entities/subject_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<SubjectEntity> subjects;

  HomeLoaded(this.subjects);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
