// ignore_for_file: file_names
class Question {
  final String question;
  final String thematique;
  final bool estVrai;

  Question({
    required this.question,
    required this.estVrai,
    required this.thematique,
  });

  bool valid(bool rep) {
    return rep == estVrai;
  }

  Map<String, dynamic> toJson() => _questionToJson(this);

  Question.fromJson(Map<String, dynamic> json)
      : this(
          question: json["question"] as String,
          estVrai: json["estVrai"] as bool,
          thematique: json["thematique"] as String,
        );

  @override
  String toString() => "Question: $question -> ($estVrai) : $thematique";

  Map<String, dynamic> _questionToJson(Question instance) => <String, dynamic>{
        'question': instance.question,
        'estVrai': instance.estVrai,
        'thematique': instance.thematique
      };
}
