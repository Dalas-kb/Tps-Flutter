import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/data/models/theme_model.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class ThemeProvider {
  static CollectionReference getCollection() {
    return firestore.collection('themes');
  }

  Query getAllTheme() {
    return ThemeProvider.getCollection().withConverter<ThemeQuiz>(
      fromFirestore: (snapshot, _) => ThemeQuiz.fromJson(snapshot.data()!),
      toFirestore: (theme, _) => theme.toJson(),
    );
  }

  Future<DocumentSnapshot<Object?>> getTheme(String id) {
    return ThemeProvider.getCollection().doc(id).get();
  }

  Future<void> addTheme(ThemeQuiz newTheme) async {
    return ThemeProvider.getCollection()
        .doc(newTheme.nom)
        .set(newTheme.toJson());
  }

  Future<void> suppTheme(String id) async {
    return ThemeProvider.getCollection().doc(id).delete();
  }
}
