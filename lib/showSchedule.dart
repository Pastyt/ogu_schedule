import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowSchedule extends StatelessWidget {
  final List<Map<String, dynamic>> _scheduleData;

  ShowSchedule(this._scheduleData);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ..._scheduleData.map((f) {
          return ListTile(
            trailing: CircleAvatar(
              child: Text(utf8.decode((f['NumberRoom']+'-'+f['Korpus']).toString().codeUnits),style:TextStyle(
          fontSize: 10
          )),
            ),
            title: Text(
                utf8.decode(
                    (f['TitleSubject'] + ' ' + f['TypeLesson'].toString())
                        .codeUnits),
                style: TextStyle(fontStyle: FontStyle.italic)),
            subtitle: Text(utf8.decode(
                ((f['Family'] + ' ' + f['Name'] + ' ' + f['SecondName'])
                        .toString())
                    .codeUnits)),
          );
        }).toList()
      ],
    );
  }
}
