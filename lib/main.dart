// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ogu_schedule/course.dart';
import 'package:ogu_schedule/showSchedule.dart';

import 'studprep.dart';
import 'showDivision.dart';
import 'group.dart';

void main() => runApp(OguSchedule());

class OguSchedule extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OguScheduleState();
  }
}

class _OguScheduleState extends State<OguSchedule> {
  List<Map<String, dynamic>> _divisionData;
  List<Map<String, dynamic>> _courseData;
  List<Map<String, dynamic>> _groupData;
  List<Map<String, dynamic>> _scheduleData;
  int _step;
  int _idDivision;
  int _idCourse;
  int _idGroup;

  _OguScheduleState() {
    _step = 0;
  }

  /* String get systemMes {
    switch (_step) {
      case 0:
        return 'Кто вы?';
        break;
      case 1:
        return 'Факультет';
      case 2:
        return 'Выберите курс';
      case 3:
        return 'Выберите группу';
      case 4:
        return 'Выберите кафедру'
    }
    return 'mes';
  } */
  _getDivisionData() async {
    final response =
        await http.get('http://oreluniver.ru/schedule/divisionlistforstuds');
    //print(response.body);
    if (response.statusCode == 200) {
      var allData = json.decode(response.body) as List<Object>;
      _divisionData = [];
      allData.forEach((f) {
        _divisionData.add((f as Map<String, dynamic>));
      });
      _step = 0;
      _changeState();
    }
  }

  _getCourseData(int added) async {
    final response =
        await http.get('http://oreluniver.ru/schedule/$added/kurslist');
    //print(response.body);
    if (response.statusCode == 200) {
      var allData = json.decode(response.body) as List<Object>;
      _courseData = [];
      allData.forEach((f) {
        _courseData.add(f as Map<String, dynamic>);
      });
      _step = 1;
      _idDivision = added;
      _changeState();
    }
  }

  _getGroupData(int added) async {
    final response = await http
        .get('http://oreluniver.ru/schedule/$_idDivision/$added/grouplist');
    //print(response.body);
    if (response.statusCode == 200) {
      var allData = json.decode(response.body) as List<Object>;
      _groupData = [];
      allData.forEach((f) {
        _groupData.add(f as Map<String, dynamic>);
      });
      _step = 2;
      _idCourse = added;
      _changeState();
    }
  }

  int _getTime() {
    var time = DateTime(1970, DateTime.january, 1);
    var duration = DateTime.now().difference(time);
    return duration.inSeconds*1000;
  }

  _getScheduleData(int added) async {
    var time = _getTime();
    final response = await http
        .get('http://oreluniver.ru/schedule//$added///$time/printschedule');
    if (response.statusCode == 200) {
      var allData = json.decode(response.body) as List<Object>;
      _scheduleData = [];
      allData.forEach((f) {
        _scheduleData.add(f as Map<String, dynamic>);
      });
      _step = 3;
      _idGroup = added;
      _changeState();
    }
  }

  _reset() {
    _step = -1;
    _changeState();
  }

  _getPrepData() async {}

  _changeState() {
    setState(() {
      _step++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Расписание ОГУ',
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: _reset,
            ),
            appBar: AppBar(
              title: Text('Расписание ОГУ'),
            ),
            body: _step == 0
                ? StudPrep(_getPrepData, _getDivisionData)
                : _step == 1
                    ? ShowDivision(_divisionData, _getCourseData)
                    : _step == 2
                        ? ShowCourse(_courseData, _getGroupData)
                        :_step==3 ? ShowGroup(_groupData, _getScheduleData):
        ShowSchedule(_scheduleData)));
  }
}
