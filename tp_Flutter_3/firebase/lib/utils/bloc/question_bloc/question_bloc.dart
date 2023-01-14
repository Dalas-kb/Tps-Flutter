import 'package:bloc/bloc.dart';
import 'package:firebase/data/models/question_model.dart';
import 'package:firebase/data/repositories/question_repository.dart';
import 'package:meta/meta.dart';
part 'question_event.dart';
part 'question_state.dart';

class blocQuestion extends Bloc<QuestionEvent, QuestionState> {
  QuestionRepository repository;

  blocQuestion(this.repository) : super(QuestionInit());
  QuestionState get initialState => QuestionInit();

  @override
  Stream<QuestionState> mapEvent(QuestionEvent event) async* {
    if (event is GetQuestions) {
      yield QuestionLoad();
      try {
        final List<Question?> questions = await repository.getQuestionsList();

        if (questions.isEmpty) {
          yield QuestionNotLoaded();
        } else {
          yield QuestionLoaded(questions);
        }
      } catch (error) {
        yield QuestionNotLoaded();
      }
    } else if (event is GetQuestionsTheme) {
      yield QuestionLoad();
      try {
        final List<Question?> questions =
            await repository.getQuestionsThemeList(event.thematique);

        if (questions.isEmpty) {
          yield QuestionNotLoaded();
        } else {
          yield QuestionLoaded(questions);
        }
      } catch (error) {
        yield QuestionNotLoaded();
      }
    }
  }
}
