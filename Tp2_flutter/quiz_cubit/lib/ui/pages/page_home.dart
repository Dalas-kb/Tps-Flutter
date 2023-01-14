import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../buisness_logic/rep_cubit.dart';
import '../../buisness_logic/question_suivante_cubit.dart';
import '../../buisness_logic/cubits/score_cubit.dart';
import '../../data/models/QuestionRepository.dart';

class MyQuizPage extends StatelessWidget {
  MyQuizPage({Key? key, required this.title}) : super(key: key);

  // On lance une partie
  final questionRepository = QuestionRepository();

  final String title;

  @override
  Widget build(BuildContext context) {
    var _resultQuestion = 2;

    void suivantQuestion(BuildContext c, int index) {
      if (index + 1 == questionRepository.getNbQuestions()) {
        c.read<SuivantCubit>().init();
        c.read<ScoreCubit>().init();
      } else {
        c.read<SuivantCubit>().suivant();
      }
      c.read<reQuestionCubit>().init();
    }

    void checkAnswer(BuildContext c, int index, bool answer) {
      if (questionRepository.questionValidation(index, answer)) {
        c.read<reQuestionCubit>().correct();
        c.read<ScoreCubit>().increment();
      } else {
        c.read<reQuestionCubit>().incorrect();
        c.read<ScoreCubit>().decrement();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Container(
                // Container for Header (score and index)
                width: 350,
                height: 50,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<SuivantCubit, int>(
                      builder: (_, index) {
                        return Center(
                          child: Text(
                              'Question ${index + 1}/${questionRepository.getNbQuestions()}',
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        );
                      },
                    ),
                    BlocBuilder<ScoreCubit, int>(
                      builder: (_, score) {
                        return Center(
                            child: Text('Score : $score',
                                style: const TextStyle(fontSize: 18)));
                      },
                    ),
                  ],
                )),
            const SizedBox(height: 10),
            Container(
                // Container for Image
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Image(
                  image: NetworkImage(
                      "https://www.dokeos.com/wp-content/uploads/2021/02/Quiz.jpg"),
                )),
            const SizedBox(height: 20),
            BlocBuilder<SuivantCubit, int>(
              builder: (_, index) {
                return BlocBuilder<reQuestionCubit, int>(builder: (_, answer) {
                  return Container(
                      // Container for Questions
                      width: 350,
                      height: 150,
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2.0,
                            color: answer == 2
                                ? Colors.blueGrey.shade200
                                : (answer == 1 ? Colors.green : Colors.red),
                          )),
                      child: Text(
                        questionRepository.getQuestion(index),
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ));
                });
              },
            ),
            const SizedBox(height: 40),
            Container(
                // Container for Buttons
                width: 350,
                height: 50,
                child: BlocBuilder<SuivantCubit, int>(builder: (_, index) {
                  return BlocBuilder<reQuestionCubit, int>(
                      builder: (_, answer) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: answer != 2
                              ? null
                              : () => checkAnswer(context, index, true),
                          child: const Text("Vrai",
                              style: TextStyle(fontSize: 18)),
                        ),
                        ElevatedButton(
                          // si c'est la fin du quiz on init
                          onPressed: answer != 2
                              ? null
                              : () => checkAnswer(context, index, false),
                          child: const Text("Faux",
                              style: TextStyle(fontSize: 18)),
                        ),
                        ElevatedButton(
                          // si c'est la fin du quiz on init
                          onPressed: answer == 2
                              ? null
                              : () => suivantQuestion(context, index),
                          child: Wrap(
                            children: [
                              Text(
                                  index + 1 ==
                                          questionRepository.getNbQuestions()
                                      ? "Recommencer"
                                      : "Passer",
                                  style: const TextStyle(fontSize: 18)),
                              const Icon(Icons.keyboard_arrow_right)
                            ],
                          ),
                        )
                      ],
                    );
                  });
                })),
          ],
        ),
      ),
    );
  }
}
