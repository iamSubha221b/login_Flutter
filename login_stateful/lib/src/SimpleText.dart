import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleTextView extends StatelessWidget {
  String title;
  int type;
  bool isPassword;
  SimpleTextView(String title, {bool isPassword = false}) {
    this.title = title;
    this.isPassword = isPassword;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: this.isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Hint',
                  labelText: 'Email',
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    )));
  }
}
