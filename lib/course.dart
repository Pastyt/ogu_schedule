import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowCourse extends StatelessWidget {
  final List<Map<String, dynamic>> courseData;
  final Function function;

  ShowCourse(this.courseData,this.function);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[

        ...courseData.map((f) {
          return ListTile(onTap: ()=> function(f['kurs']),
              title: Text(f['kurs'].toString())
          );
        })
      ],
    );
  }
}