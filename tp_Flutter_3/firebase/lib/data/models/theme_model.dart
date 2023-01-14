class ThemeQuiz {
  final String nom;
  final String url;

  ThemeQuiz({
    required this.nom,
    required this.url,
  });

  Map<String, dynamic> toJson() => themeToJson(this);

  String getUrl() {
    return url != ""
        ? url
        : "https://static.cnsf.asso.fr/wp-content/uploads/2019/06/QUIZZ_m.jpg";
  }

  ThemeQuiz.fromJson(Map<String, dynamic> json)
      : this(
          nom: json["nom"] as String,
          url: json["url"] as String,
        );

  @override
  String toString() => "Thematique: $nom -> ($url)";

  Map<String, dynamic> themeToJson(ThemeQuiz instance) => <String, dynamic>{
        'nom': instance.nom,
        'url': instance.url,
      };
}
