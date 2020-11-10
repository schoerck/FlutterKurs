import 'package:flutter/material.dart';
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

  //void, da die Funktion nur ausführt und nichts zurückgibt
  void _answerquestion() {
    setState(() {
      _questionindex++; //setstate verlangt eine anonyme methode (in diesem Fall soll der state je nach questionindex geändert werden)
    });
    print(_questionindex);
  }

  var questions = [
    //Liste von Daten wird in eckige Klammern geschrieben (in diesem Fall alle Fragen)
    'Was ist deine Lieblingsfarbe?',
    'Was ist dein Lieblingstier?',
  ];

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
        body: Column(
          children: <Widget>[
            Question( //jedes mal wenn Question aufgerufen wurd, wird ein neues Objekt (mit dem Konstruktor) von Question angelegt
              questions[_questionindex],
            ), //.elementAt(n) zeigt auf das n'te Element in der Liste questions //oder neu: [n]
            RaisedButton(
                child: Text('Antwort 1'),
                onPressed:
                    _answerquestion), //Klammern der Methode werden weggelassen, da nichts übergeben wird (es wird die Methode an sich übergeben und nicht das Resultat der Methode)
            RaisedButton(
                child: Text('Antwort 2'),
                onPressed:
                    _answerquestion), //Pointer der auf die answerquestionmethode zweigt
            RaisedButton(
                child: Text('Antwort 3'),
                onPressed: () => print(
                    'Haha ich bin eine anonyme Funktion !') //Anonyme Funktionen werden direkt in den Code geschrieben mit () => ...  //oder (){...}
                ),
          ],
        ),
      ),
    );
  }
}
