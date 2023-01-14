import 'package:firebase/buisness_logic/cubits%20/score_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoreCubit, int>(
      builder: (_, score) {
        return Center(
            child:
                Text('Score : $score', style: const TextStyle(fontSize: 18)));
      },
    );
  }
}
