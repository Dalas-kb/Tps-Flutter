import 'package:firebase/buisness_logic/bloc/theme_bloc/theme_bloc.dart';
import 'package:firebase/view/pages/forms/formulaire_theme_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ThemeBloc>(context);
    themeBloc.add(GetAllThemes());

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const FormulaireTheme(
                        title: 'Ajouter un Quiz',
                      )),
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
