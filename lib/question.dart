import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String
      questiontext; //final bedeutet, dass die variable nie wieder veränderbar ist nachdem ein wert eingetragen wurde

  Question(this.questiontext);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //double.infinity nimmt die gesamte Bildschirm -(hier Breite) ein
      margin: EdgeInsets.all(8),
      child: Text(
        questiontext,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
//sobald jemand ein Objekt von Questions anlegt, erhält er als return den questiontext
