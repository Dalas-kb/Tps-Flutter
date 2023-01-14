import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../View/models/QuestionRepository.dart';

class Quizz extends StatelessWidget {
  Quizz({Key? key, required this.title}) : super(key: key);

  final String title;

  get index => null;

  void _questionSuivante(BuildContext context) {
    Provider.of<QuestionRepository>(context, listen: false).questionSuivante();
  }

  void _answerQuestion(BuildContext context, bool answer) {
    Provider.of<QuestionRepository>(context, listen: false)
        .answerQuestion(answer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Container(
                // Container for Header (score and index)
                width: 350,
                height: 70,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Question ${Provider.of<QuestionRepository>(context).getIndex() + 1}/${Provider.of<QuestionRepository>(context).getLengthQuestion()}',
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text(
                        'Score : ${Provider.of<QuestionRepository>(context).getScore()}',
                        style: const TextStyle(fontSize: 18)),
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
            Container(
                width: 350,
                height: 150,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2.0,
                      color: Provider.of<QuestionRepository>(context)
                                  .getResult() ==
                              3
                          ? Colors.blueGrey.shade200
                          : (Provider.of<QuestionRepository>(context)
                                      .getResult() ==
                                  1
                              ? Colors.green
                              : Colors.red),
                    )),
                child: Text(
                  Provider.of<QuestionRepository>(context).getQuestion(),
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(height: 40),
            Container(
              // Container for Buttons
              width: 350,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: Provider.of<QuestionRepository>(context)
                            .getButtonDisabled()
                        ? null
                        : () => _answerQuestion(context, true),
                    child: const Text("Vrai", style: TextStyle(fontSize: 18)),
                  ),
                  ElevatedButton(
                      onPressed: Provider.of<QuestionRepository>(context)
                              .getButtonDisabled()
                          ? null
                          : () => _answerQuestion(context, false),
                      child:
                          const Text("Faux", style: TextStyle(fontSize: 18))),
                  ElevatedButton(
                    onPressed: !Provider.of<QuestionRepository>(context)
                            .getButtonDisabled()
                        ? null
                        : () => _questionSuivante(context),
                    child: Wrap(
                      children: [
                        Text(
                            Provider.of<QuestionRepository>(context).finQuiz()
                                ? "Recommencer"
                                : "Passer",
                            style: const TextStyle(fontSize: 18)),
                        const Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
