
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

            submitButton(bloc),
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
      stream: bloc.password,
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


  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder:(context,snapshot) {

          return RaisedButton(
            child: Text('Login'),
            color: Colors.lightBlue,
            onPressed: snapshot.hasData ?  () {

              if(snapshot.hasError)
                print('Email or Password is wrong!');
              else {
                print('Hi There!');
                bloc.submit();
              }
            }
            : null,
          );
        },
    );
  }

}
