import 'package:flutter/material.dart';
import 'package:login_stateful/src/login_bloc/screens/login_screen.dart';
import 'package:login_stateful/src/login_bloc/provider.dart';




class Bloc_app extends StatelessWidget {
  build(context) {

    return Provider(
      child: MaterialApp(
      title: 'Log Me In',
      home: Scaffold(
        body: LoginScreen(),
      ),
    ),
    );
  }
}
