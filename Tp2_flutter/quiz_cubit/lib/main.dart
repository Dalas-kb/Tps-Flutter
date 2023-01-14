import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_cubit/ui/pages/page_home.dart';
import 'buisness_logic/rep_cubit.dart';
import 'buisness_logic/question_suivante_cubit.dart';
import 'buisness_logic/cubits/score_cubit.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
      ],
      child: MaterialApp(
        title: 'Questions/Réponses',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyQuizPage(title: 'Quiz Cubit'),
      ),
    );
  }
}
