import 'package:flutter/material.dart';
import 'package:flutter_provider/HomePage/pages/page_quiz.dart';

import 'package:provider/provider.dart';

import 'View/models/QuestionRepository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuestionRepository(),
      child: MaterialApp(
        title: 'Quizz_pro',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Quizz(title: 'Questions/Réponses'),
      ),
    );
  }
}
