part of 'question_bloc.dart';

@immutable
abstract class QuestionEvent {}

class GetQuestions extends QuestionEvent {
  GetQuestions();
  List<Object> get props => [];
  @override
  String toString() => 'GetQuestions';
}

class GetQuestionsTheme extends QuestionEvent {
  final String thematique;

  GetQuestionsTheme(this.thematique);
  List<Object> get props => [thematique];
  @override
  String toString() => 'GetQuestionsTheme';
}
