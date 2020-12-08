import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';
import 'dart:async';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}



class LoginScreenState extends State<LoginScreen>  with ValidationMixin {
  bool _obscureText = true;
  final formkey = GlobalKey<FormState>();
  String email = '', password = '';

  _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });

    // return _obscureText;
  }

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formkey,
        child: Column(
          children: [
            //  SimpleTextView('Title'),
            emailField(),
            passwordField(),
            Container(
              margin: EdgeInsets.only(top: 25.0),
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email ',
        hintText: 'you@me.com',
      ),
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
        print(value);
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'password',
      ),
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
        print(value);
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
        child: Text('Submit'),
        color: Colors.lightBlue,
        onPressed: () {
          if (formkey.currentState.validate()) {
            formkey.currentState.save();

            print('Time to post $email and $password');
          } else {
            formkey.currentState.validate();
          }
           _toggle();
        });
  }
}
