import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function
      selectHandler;  //eine Funktion wird in selecthandler übergeben und gespeichert
                      //selecthandler bekommt hier die funktion _answerquestion aus der main übergeben
  final String answerText;
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
          color: Colors.blue,
          child: Text(answerText),
          onPressed: selectHandler),
    );
  }
}
