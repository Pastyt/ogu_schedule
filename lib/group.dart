import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowGroup extends StatelessWidget {
  final List<Map<String, dynamic>> groupData;
  final Function function;

  ShowGroup(this.groupData, this.function);

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      ...groupData.map((f) {
        return ListTile(onTap: ()=>function(f['idgruop']),
        title: Text(utf8.decode(f['title'].toString().codeUnits)));
      })
    ]);
  }
}
