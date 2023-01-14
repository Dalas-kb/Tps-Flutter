import 'package:flutter/cupertino.dart';
import 'package:flutter_provider/View/models/question.dart';

class QuestionRepository extends ChangeNotifier {
  int score = 0;
  int index = 0;

  int estVrai = 3;
  bool estDesactiver = false;

  final List<Question> questions = [
    Question("L'Académie berbère présente le premier drapeau berbère en 1970?",
        true),
    Question("Karim Benzema a remporté le Ballon d'Or 2022?", true),
    Question("L’Algérie est le 15e pays le plus peuplé au monde?", false),
    Question(
        "La construction de la tour Eiffel a duré cinq ans et quatre mois?",
        false),
    Question("À la base, la tour Eiffel devait durer seulement 20 ans ?", true),
    Question(
        "La phrase suivante est une phrase de base : « Je suis fatigué. ?»",
        true),
    Question(
        "La théobromine contenue dans le chocolat est toxique pour les chiens ?",
        true),
    Question("Il existe jusqu'à 1 000 variétés de thé ?", false),
  ];
  QuestionRepository();

  String getQuestion() {
    return questions[index].questionText.toString();
  }

  String getLengthQuestion() {
    return questions.length.toString();
  }

  int getResult() {
    return estVrai;
  }

  int getScore() {
    return score;
  }

  int getIndex() {
    return index;
  }

  void reloadQuiz() {
    index = 0;
    score = 0;
    estVrai = 3;
    estDesactiver = false;
    notifyListeners();
  }

  bool getButtonDisabled() {
    return estDesactiver;
  }

  void questionSuivante() {
    if (estDesactiver) {
      index + 1 == questions.length ? reloadQuiz() : index++;
      estVrai = 3;
      estDesactiver = false;
      notifyListeners();
    }
  }

  void answerQuestion(bool answer) {
    if (answer == questions[index].isCorrect) {
      estVrai = 1;
      score += 3;
      estDesactiver = true;
    } else {
      estVrai = 0;
      score = (score > 0 ? score - 1 : 0);
      estDesactiver = true;
    }
    notifyListeners();
  }

  bool finQuiz() {
    return (index + 1 == questions.length) && estDesactiver;
  }
}
