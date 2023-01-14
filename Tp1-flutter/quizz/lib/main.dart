import 'package:flutter/material.dart';
import 'package:quizz/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Quizz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => Myquizz();
}

class Myquizz extends State<MyHomePage> {
  int score = 0;
  int index = 0;
  int estVrai = 0;
  bool estDesactiver = false;

  final List<Question> question = [
    Question("L'Académie berbère présente le premier drapeau berbère en 1970?",
        true),
    Question("Karim Benzema a remporté le Ballon d'Or 2022?", true),
    Question("L’Algérie est le 15e pays le plus peuplé au monde?", false),
    Question(
        "La construction de la tour Eiffel a duré cinq ans et quatre mois?",
        false),
    Question("À la base, la tour Eiffel devait durer seulement 20 ans ?", true),
    Question(
        "La phrase suivante est une phrase de base : « Je suis fatigué. ?»",
        true),
    Question(
        "La théobromine contenue dans le chocolat est toxique pour les chiens ?",
        true),
    Question("Il existe jusqu'à 1 000 variétés de thé ?", false),
  ];

  void reloadQuiz() {
    setState(() {
      index = 0;
      score = 0;
      estVrai = 0;
      estDesactiver = false;
    });
  }

  void checkVrai() {
    if (true == question[index].isCorect) {
      repVrai();
    } else {
      repFaux();
    }
  }

  void chekFaux() {
    if (false == question[index].isCorect) {
      repVrai();
    } else {
      repFaux();
    }
  }

  void questionSuivante() {
    setState(() {
      if (estDesactiver) {
        index + 1 == question.length ? reloadQuiz() : index++;
        estVrai = 0;
        estDesactiver = false;
      }
    });
  }

  void repFaux() {
    setState(() {
      estVrai = 2;
      score = score - 1;
      estDesactiver = true;
    });
  }

  void repVrai() {
    setState(() {
      estVrai = 1;
      score = score + 3;
      estDesactiver = true;
    });
  }

  bool finQuizz() {
    return (index + 1 == question.length) && estDesactiver;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Container(
                width: 350,
                height: 50,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Question ${index + 1}/${question.length}',
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text('Score : $score',
                        style: const TextStyle(fontSize: 18)),
                  ],
                )),
            const SizedBox(height: 10),
            Container(
                // image
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image(
                  image: NetworkImage(
                      "https://www.dokeos.com/wp-content/uploads/2021/02/Quiz.jpg"),
                )),
            const SizedBox(height: 20),
            Container(
                // question
                width: 350,
                height: 150,
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2.0,
                      color: estVrai == 0
                          ? Colors.blueGrey.shade200
                          : (estVrai == 1 ? Colors.green : Colors.red),
                    )),
                child: Text(
                  question[index].question.toString(),
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(height: 40),
            const SizedBox(height: 100),
            Container(
              //Button
              width: 350,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: estDesactiver ? null : checkVrai,
                    child: const Text("Vrai", style: TextStyle(fontSize: 18)),
                  ),
                  ElevatedButton(
                      onPressed: estDesactiver ? null : chekFaux,
                      child:
                          const Text("Faux", style: TextStyle(fontSize: 18))),
                  ElevatedButton(
                    onPressed: !estDesactiver ? null : questionSuivante,
                    child: Wrap(
                      children: [
                        Text(finQuizz() ? "Recommencer" : "Passer",
                            style: const TextStyle(fontSize: 18)),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
