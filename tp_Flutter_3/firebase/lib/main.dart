import 'package:firebase/buisness_logic/bloc/question_bloc/question_bloc.dart';
import 'package:firebase/buisness_logic/bloc/theme_bloc/theme_bloc.dart';
import 'package:firebase/buisness_logic/cubits%20/question_suivante_cubit.dart';
import 'package:firebase/buisness_logic/cubits%20/rep_cubit.dart';
import 'package:firebase/buisness_logic/cubits%20/score_cubit.dart';
import 'package:firebase/data/repositories/question_repository.dart';
import 'package:firebase/view/pages/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories/theme_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SuivantCubit>(
          create: (BuildContext context) => SuivantCubit(),
        ),
        BlocProvider<ScoreCubit>(
          create: (BuildContext context) => ScoreCubit(),
        ),
        BlocProvider<reQuestionCubit>(
          create: (BuildContext context) => reQuestionCubit(),
        ),
        BlocProvider<blocQuestion>(
          create: (BuildContext context) => blocQuestion(QuestionRepository()),
        ),
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(ThemeRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Questions/Réponses',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: QuizPage(title: 'Quiz firebase'),
      ),
    );
  }
}
