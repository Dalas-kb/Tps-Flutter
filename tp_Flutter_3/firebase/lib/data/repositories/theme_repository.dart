import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/data/dataproviders/theme_provider.dart';
import 'package:firebase/data/models/theme_model.dart';
import 'package:flutter/material.dart';

class ThemeRepository {
  ThemeRepository({Key? key});
  final themeP = ThemeProvider();

  Stream<QuerySnapshot> getAllTheme() => themeP.getAllTheme().snapshots();

  Future<List<ThemeQuiz?>> getThemeList() async {
    return themeP.getAllTheme().get().then((snapshot) {
      final List<ThemeQuiz?> themes = [];
      for (var doc in snapshot.docs) {
        themes.add(doc.data() as ThemeQuiz);
      }
      return themes;
    });
  }

  Future<DocumentSnapshot> getTheme(String id) async =>
      await themeP.getTheme(id);

  Future<void> addTheme(String nom, String url) async =>
      await themeP.addTheme(ThemeQuiz(nom: nom, url: url));

  Future<void> deleteTheme(String id) async => await themeP.suppTheme(id);
}
