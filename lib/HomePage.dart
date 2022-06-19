import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget Button() {
    return FlatButton(
      color: Colors.red,
      padding: EdgeInsets.all(5),
      child: Text("aa"),
      onPressed: () {
        Navigator.pushNamed(context, '/second');
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Row(children: [
            Button(),
            Button(),
            Button(),
            Button(),
            Button(),
          ],
            crossAxisAlignment: CrossAxisAlignment.center,
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, '/second');
      }),
    );
  }
}
