part of 'thematique_bloc.dart';

@immutable
abstract class ThemeState {}

class ThematiqueInit extends ThemeState {}

class ThemeInit extends ThemeState {
  @override
  String toString() => 'ThemeInitial';
}

class ThemeLoading extends ThemeState {
  @override
  String toString() => 'ThemeLoading';
}

class ThemeLoaded extends ThemeState {
  List<ThemeQuiz?> themes = [];

  ThemeLoaded(this.themes);

  List<ThemeQuiz?> get getThemes => themes;

  List<Object> get props => [themes];

  @override
  String toString() => 'ThemeLoaded';
}

class ThemeNotLoaded extends ThemeState {
  @override
  String toString() => 'ThemeNotLoaded';
}
