import 'package:flutter_bloc/flutter_bloc.dart';

class SuivantCubit extends Cubit<int> {
  SuivantCubit() : super(0);

  void suivant() => emit(state + 1);
  void init() => emit(0);
}
