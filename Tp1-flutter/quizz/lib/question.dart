class Question {
  String? question;
  bool? isCorect;

  Question(this.question, this.isCorect);

  bool valid(bool reponse) {
    return reponse == isCorect;
  }
}
