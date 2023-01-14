import 'package:firebase/data/repositories/question_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormulaireQuestions extends StatelessWidget {
  const FormulaireQuestions({Key? key, required this.theme}) : super(key: key);

  final String theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nouvelle question ($theme)"),
        ),
        body: Container(
            padding: const EdgeInsets.all(25.0),
            child: QuestionFormulaire(theme: theme)));
  }
}

class QuestionFormulaire extends StatefulWidget {
  const QuestionFormulaire({Key? key, required this.theme}) : super(key: key);

  final String theme;
  @override
  QuestionFormulaireState createState() {
    return QuestionFormulaireState();
  }
}

class QuestionFormulaireState extends State<QuestionFormulaire> {
  final formQ = GlobalKey<FormState>();

  late TextEditingController controlQuestion;

  bool isSwitched = false;
  @override
  void initState() {
    super.initState();
    controlQuestion = TextEditingController();
  }

  @override
  void dispose() {
    controlQuestion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formQ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controlQuestion,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'saisez la question',
              labelText: 'Question',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'La question est introvable.';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 17,
          ),
          Row(
            children: [
              const Text("reponse "),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              if (formQ.currentState!.validate()) {
                final QuestionRepository repository = QuestionRepository();
                repository.addQuestion(
                    controlQuestion.text, isSwitched, widget.theme);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ajout de la question')),
                );
              }
            },
            child: const Text('Créer la question'),
          ),
        ],
      ),
    );
  }
}
