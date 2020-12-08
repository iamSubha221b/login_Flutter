
import 'package:flutter/material.dart';
import 'package:login_stateful/src/login_bloc/blocs/bloc.dart';
import "package:login_stateful/src/login_bloc/provider.dart";

class LoginScreen extends StatelessWidget {
  Widget build(context) {

    final bloc = Provider.of(context);

    return Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [

           emailField(bloc),
            passwordField(bloc),

            Container(
              margin: EdgeInsets.only(top: 25.0),
            ),

            submitButton(),
          ],
        ));
  }



  Widget emailField(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context,snapshot){
        return TextField(
          keyboardType: TextInputType.emailAddress,

          onChanged: bloc.changeEmail,
          decoration: InputDecoration(
            hintText: 'you@me.com',
            labelText: 'Email Address',
            errorText: snapshot.error,
          ),

        );

      },
    );

  }

  Widget passwordField(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.Password,
      builder:(context,snapshot)
        {
          return TextField(
            obscureText: true,
            onChanged: (newValue)
            {
              bloc.changePassword(newValue);
            },
            decoration: InputDecoration(
                hintText: '******',
                labelText: 'Enter Password',
              errorText: snapshot.error,
            ),

          );
        }
    );
  }


  Widget submitButton() {
    return RaisedButton(
        child: Text('Login'),
        color: Colors.lightBlue,


        onPressed: () {

          // _toggle();
        },
    );
  }
}
