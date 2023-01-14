import 'package:quiz_cubit/data/models/question.dart';

class QuestionRepository {
  QuestionRepository();

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

  String getQuestion(int index) {
    return questions[index].question.toString();
  }

  bool questionValidation(int index, bool answer) {
    return questions[index].estVrai == answer;
  }

  int getNbQuestions() {
    return questions.length;
  }
}
