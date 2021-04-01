import 'package:flutter/material.dart';
import 'package:login_stateful/animation/screens/home.dart';

class Animationapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: Home(),
    );
  }
}
