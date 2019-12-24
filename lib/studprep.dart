import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudPrep extends StatelessWidget {
  final Function getPrep, getStud;

  StudPrep(this.getPrep, this.getStud);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      /*Container(
              width: double.infinity,
              child: Text(systemMes,textAlign: TextAlign.center,style: TextStyle(
                fontSize: 35
              ),),
            ),*/

      RaisedButton(
          onPressed: getStud,
          child: Text(
            '    Студент  ',
            style: TextStyle(fontSize: 15),
          ),
          textTheme: ButtonTextTheme.primary),
      RaisedButton(
          onPressed: getPrep,
          child: Text(
            'Преподаватель (NOT WORK)',
            style: TextStyle(fontSize: 15),
          ),
          textTheme: ButtonTextTheme.primary)
    ]));
  }
}
