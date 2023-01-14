import 'package:firebase/buisness_logic/bloc/question_bloc/question_bloc.dart';
import 'package:firebase/buisness_logic/cubits%20/question_suivante_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuivantCubit, int>(
      builder: (_, index) {
        return Center(
          child: BlocBuilder<blocQuestion, QuestionState>(
            builder: (context, state) {
              if (state is QuestionLoaded) {
                return Text('Question ${index + 1}/${state.questions.length}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold));
              } else {
                return Container();
              }
            },
          ),
        );
      },
    );
  }
}
