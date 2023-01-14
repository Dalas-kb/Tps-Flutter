import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/data/dataproviders/question_provider.dart';
import 'package:firebase/data/models/question_model.dart';
import 'package:flutter/material.dart';

class QuestionRepository {
  QuestionRepository({Key? key});
  final questionPr = ProviderQuestion();

  Stream<QuerySnapshot> getAllQuestions() =>
      questionPr.getQuestions().snapshots();

  Stream<QuerySnapshot> getAllQuestionsByThematique(String thematique) =>
      questionPr.getQuestionsTheme(thematique).snapshots();

  Future<List<Question?>> getQuestionsList() async {
    return questionPr.getQuestions().get().then((snapshot) {
      final List<Question?> questions = [];
      for (var doc in snapshot.docs) {
        questions.add(doc.data() as Question);
      }
      return questions;
    });
  }

  Future<List<Question?>> getQuestionsThemeList(String thematique) async {
    return questionPr.getQuestionsTheme(thematique).get().then((snapshot) {
      final List<Question?> questions = [];
      for (var doc in snapshot.docs) {
        questions.add(doc.data() as Question);
      }
      return questions;
    });
  }

  Future<DocumentSnapshot> getQuestion(String id) async =>
      await questionPr.getQuestion(id);

  Future<void> addQuestion(
          String question, bool isTrue, String thematique) async =>
      await questionPr.addQuestion(Question(
          question: question, estVrai: isTrue, thematique: thematique));

  Future<void> deleteQuestion(String id) async =>
      await questionPr.suppQuestion(id);
}
