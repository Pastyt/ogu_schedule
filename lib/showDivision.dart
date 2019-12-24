import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDivision extends StatelessWidget{
  final List<Map<String, dynamic>> divisionData;
  final Function function;
  ShowDivision(this.divisionData,this.function);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ...divisionData.map((f) {
          return ListTile(onTap:()=> function(f['idDivision']),
              title: Text(utf8.decode( f['shortTitle'].toString().codeUnits))
          );
        })
      ],
    );
  }

}