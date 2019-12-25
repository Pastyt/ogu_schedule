import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudPrep extends StatelessWidget {
  final Function getPrep, getStud;

  StudPrep(this.getPrep, this.getStud);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
        width: double.infinity,
       // child: Center(
            child: Column(

            children: <Widget>[
      /*Container(
              width: double.infinity,
              child: Text(systemMes,textAlign: TextAlign.center,style: TextStyle(
                fontSize: 35
              ),),
            ),*/
  Container(
    child:
      RaisedButton(
          onPressed: getStud,
          child: Text(
            'Студент',
            style: TextStyle(fontSize: 15),
          ),
          textTheme: ButtonTextTheme.primary)),
        Container(
          child:
      RaisedButton(
          onPressed: getPrep,
          child: Text(
            'Преподаватель',
            style: TextStyle(fontSize: 15),
          ),
          textTheme: ButtonTextTheme.primary)
        )]));
  }
}
