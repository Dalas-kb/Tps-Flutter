import 'package:firebase/buisness_logic/bloc/thematique_bloc/thematique_bloc.dart';
import 'package:firebase/data/repositories/theme_repository.dart';
import 'package:firebase/presentation/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormulaireTheme extends StatelessWidget {
  const FormulaireTheme({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
            padding: const EdgeInsets.all(25.0), child: const ThemeForm()));
  }
}

class ThemeForm extends StatefulWidget {
  const ThemeForm({Key? key}) : super(key: key);

  @override
  ThemeFormState createState() {
    return ThemeFormState();
  }
}

class ThemeFormState extends State<ThemeForm> {
  final formT = GlobalKey<FormState>();

  late TextEditingController controlNameTheme;
  late TextEditingController controlURLTheme;

  @override
  void initState() {
    super.initState();
    controlNameTheme = TextEditingController();
    controlURLTheme = TextEditingController();
  }

  @override
  void dispose() {
    controlNameTheme.dispose();
    controlURLTheme.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ThematiqueBloc>(context);
    themeBloc.add(GetAllThemes());
    return Form(
      key: formT,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controlNameTheme,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'saisez le nom de la thématique',
              labelText: 'Thème',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Le nom de la thématique est introvable.';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          // URL input
          TextFormField(
            controller: controlURLTheme,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Lien de l\'image de thématique',
              labelText: 'URL',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              if (formT.currentState!.validate()) {
                final ThemeRepository repositor = ThemeRepository();
                repositor.addTheme(controlNameTheme.text, controlURLTheme.text);
                themeBloc.add(GetAllThemes());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePage(
                            title: 'Thématiques',
                          )),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ajout de thématique')),
                );
              }
            },
            child: const Text('Créer la thématique'),
          ),
        ],
      ),
    );
  }
}
