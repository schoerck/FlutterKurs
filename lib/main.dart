import 'package:flutter/material.dart';
import 'package:quiz_app/answers.dart';
import 'package:quiz_app/question.dart';

//void main() {
//  runApp(MyApp());
//}
//diese Methode kann auf folgende Methode verkürzt werden, da nur eine Aktion (runApp) ausgeführt wird
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(); //Verbindung zur class MyAppState
  }
}

class _MyAppState extends State<MyApp> {
  //State klasse enthält Methoden wie setState()
  //das stateless widget myappstate erbt die funktionalität von dem stateful widget myapp
  var _questionindex = 0;

  final questions = const [
    {
      'questiontext': 'Was ist deine Lieblingsfarbe',
      'answers': ['Schwarz', 'Rot', 'Blau', 'Magenta']
    },
    {
      'questiontext': 'Was ist dein Lieblingstier',
      'answers': ['Löwe', 'Tiger', 'Bär', 'Elefant']
    },
    {
      'questiontext': 'Wer ist dein Lieblingsdozent',
      'answers': ['Hän', 'Näd', 'Rol', 'Chapo']
    }
  ];

  //void, da die Funktion nur ausführt und nichts zurückgibt
  void _answerquestion() {
    setState(() {
      _questionindex++; //setstate verlangt eine anonyme methode (in diesem Fall soll der state je nach questionindex geändert werden)
    });
    print(_questionindex);

    if (_questionindex < questions.length) {
      print('Wir haben noch ein paar Fragen');
    }
    else{

    }
  }

  //override (Decorator) -> build Methode muss überschrieben werden, ansonsten würde die klassische build Methode return null zurückgeben! (@override kann auch weggelassen werden)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //Scaffold ist eine einfache "Seite" einer App im Material Design (beinhaltet Dinge wie appbar, body, etc)
        appBar: AppBar(
          //title und body stellen named arguments dar
          title: Text('Meine erste App'),
        ),
        body: _questionindex<questions.length ? Column(
          children: <Widget>[
            Question(
              //jedes mal wenn Question aufgerufen wurd, wird ein neues Objekt (mit dem Konstruktor) von Question angelegt
              questions[_questionindex][
                  'questiontext'], //Syntax: aus der var questions, an der position questionindex, mit dem keyword questionword
            ), //.elementAt(n) zeigt auf das n'te Element in der Liste questions //oder neu: [n]
            ...(questions[_questionindex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerquestion,
                  answer); //zuerst wird auf answers zugegriffen-> ['answers'], dart weiß nicht das hier eine Liste vorliegt, daher as List <String>. die .map funktion ruft eine methode auf -> hier anonyme methode, die eine antwort aus der Liste übergeben bekommt und ein Answer Objekt returned. .map erzeugt nur eine Iterable, wir brauchen die Objekte als Liste-> daher .toList()  . durch die ... wandeln wir die Liste in einzelne Objekte um
            }).toList()
          ],
        ) : Center(child: Text('Du bist fertig!'),),
      ),
    );
  }
}
