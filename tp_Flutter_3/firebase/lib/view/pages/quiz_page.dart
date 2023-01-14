import 'package:firebase/buisness_logic/bloc/question_bloc/question_bloc.dart';
import 'package:firebase/buisness_logic/cubits%20/question_suivante_cubit.dart';
import 'package:firebase/buisness_logic/cubits%20/rep_cubit.dart';
import 'package:firebase/view/Widgets/all/image_quiz_widget.dart';
import 'package:firebase/view/Widgets/all/index_quiz_widget.dart';
import 'package:firebase/view/Widgets/buttons/buttons_quiz_widget.dart';
import 'package:firebase/view/pages/forms/formulaire_questions.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class QuizPage extends StatelessWidget {

  const QuizPage({Key? key, required this.thematique}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionBloc = BlocProvider.of<blocQuestion>(context);

    double valueProgressBar(int answer, int index, int indexMax) {
      return answer == 2 ? (index) / indexMax : (index + 1) / indexMax;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz :"),
        actions: const <Widget>[],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<blocQuestion, QuestionState>(
          builder: (context, state) {
            if (state is QuestionLoaded) {
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                    SizedBox(
                      height: 30,
                    ),
                    CircularProgressIndicator()
                  ]));
            }
            if (state is QuestionLoaded) {
              return Center(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  width: 400,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                IndexPage(), 
                              ],
                            )),
                        const SizedBox(height: 10),
                        BlocBuilder<reQuestionCubit, int>(
                          builder: (_, answer) {
                            return BlocBuilder<SuivantCubit, int>(
                              builder: (_, index) {
                                return ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: LinearProgressIndicator(
                                    value: valueProgressBar(
                                        answer, index, state.questions.length),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        ImageQuiz(url: theme.getUrl()),
                        const SizedBox(height: 20),

                        BlocBuilder<SuivantCubit, int>(
                          builder: (_, index) {
                            return BlocBuilder<reQuestionCubit, int>(
                                builder: (_, answer) {
                              return Container(
                                  width: 350,
                                  height: 150,
                                  padding: const EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: answer == 2
                                          ? Colors.transparent
                                          : (answer == 1
                                              ? Color.fromARGB(255, 200, 230, 228)
                                              : Color.fromARGB(255, 255, 205, 248)),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 2.0,
                                        color: answer == 2
                                            ? Colors.blueGrey.shade200
                                            : (answer == 1
                                                ? Colors.white54
                                                : Colors.blueGrey),
                                      )),
                                  child:
                                      BlocBuilder<blocQuestion, QuestionState>(
                                    builder: (context, state) {
                                      if (state is QuestionLoad) {
                                        // Chargement
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      } else if (state is QuestionLoaded) {
                                        return Text(
                                          state.getQuestions
                                              .elementAt(index)!
                                              .question
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: answer == 2
                                                ? Theme.of(context).hintColor
                                                : Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        );
                                      } else if (state is QuestionNotLoaded) {
                                        return const Center(
                                            child: Text("Aucun résultats"));
                                      }
                                      return const Center(
                                          child: Text("Aucun résultats"));
                                    },
                                  ));
                            });
                          },
                        ),
                        const SizedBox(height: 40),
                        ButtonsQuiz(state: state),
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}

class ButtonQuestionPage extends StatelessWidget {
  const ButtonQuestionPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FormulaireQuestions()),
          ),
          child: const Icon(
            Icons.add,
            size: 26.0,
          ),
        ));
  }
}
