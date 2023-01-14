import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/data/models/question_model.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class ProviderQuestion {
  static CollectionReference getCollection() {
    return firestore.collection('questions');
  }

  Query getQuestions() {
    return ProviderQuestion.getCollection().withConverter<Question>(
      fromFirestore: (snapshot, _) => Question.fromJson(snapshot.data()!),
      toFirestore: (question, _) => question.toJson(),
    );
  }

  Query getQuestionsTheme(String thematique) {
    return ProviderQuestion.getCollection()
        .where("thematique", isEqualTo: thematique)
        .withConverter<Question>(
          fromFirestore: (snapshot, _) => Question.fromJson(snapshot.data()!),
          toFirestore: (question, _) => question.toJson(),
        );
  }

  Future<DocumentSnapshot<Object?>> getQuestion(String id) {
    return ProviderQuestion.getCollection().doc(id).get();
  }

  Future<void> addQuestion(Question newQuestion) async {
    return ProviderQuestion.getCollection().doc().set(newQuestion.toJson());
  }

  Future<void> suppQuestion(String id) async {
    return ProviderQuestion.getCollection().doc(id).delete();
  }

  Future<void> suppQuestionsTheme(String id) async {
    return ProviderQuestion.getCollection().doc(id).delete();
  }
}
