import 'package:flutter_bloc/flutter_bloc.dart';

class reQuestionCubit extends Cubit<int> {
  reQuestionCubit() : super(2);

  void correct() => emit(1);
  void incorrect() => emit(0);
  void init() => emit(2);
}
