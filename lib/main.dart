
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'package:auto_diary/screen2.dart';
import 'package:auto_diary/HomePage.dart';

//TODO : make calendar?;
//TODO : make griditems and put the number of photos of each day
//TODO : get location from photo


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: MyFileList("202210"), //call MyFile List
        initialRoute: '/home',
        routes: {
          '/home' : (context) => HomePage(),
          '/second' : (context) => MyFileList('202210'),
        }
    );
  }
}

