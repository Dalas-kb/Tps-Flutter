import 'package:flutter_bloc/flutter_bloc.dart';

class ScoreCubit extends Cubit<int> {
  ScoreCubit() : super(0);

  void increment() => emit(state + 3);
  void decrement() => emit(state - 1);
  void init() => emit(0);
}
