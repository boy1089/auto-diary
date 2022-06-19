
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
        home: MyFileList(date:"202210"), //call MyFile List
        initialRoute: '/home',
        routes: {
          '/home' : (context) => HomePage(),
          '/second' : (context) => MyFileList(date:'202210'),

        },
        onGenerateRoute: (routeSettings){
          if (routeSettings.name == '/second'){

            final args = routeSettings.arguments;
            var aa = args.toString();
            print('onGenerate $aa');
            return MaterialPageRoute(
              builder: (context){

                return MyFileList(date: args.toString());
              }
            );
          }
        }
    );
  }
}

