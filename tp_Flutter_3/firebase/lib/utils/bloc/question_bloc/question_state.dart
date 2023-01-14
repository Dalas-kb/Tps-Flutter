part of 'question_bloc.dart';

@immutable
abstract class QuestionState {}

class QuestionInit extends QuestionState {
  @override
  String toString() => 'QuestionInit';
}

class QuestionLoad extends QuestionState {
  @override
  String toString() => 'QuestionLoad';
}

class QuestionLoaded extends QuestionState {
  List<Question?> questions = [];

  QuestionLoaded(this.questions);

  List<Question?> get getQuestions => questions;

  List<Object> get props => [questions];

  @override
  String toString() => 'QuestionLoaded';
}

class QuestionNotLoaded extends QuestionState {
  @override
  String toString() => 'QuestionNotLoaded';
}
