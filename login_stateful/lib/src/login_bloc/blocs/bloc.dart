import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators
{
//  final  _emailController = StreamController<String>.broadcast();
 // final _passwordController = StreamController<String>.broadcast();

  final  _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();



  // change data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  
  
  
  // retrieve stream
   get email => _emailController.stream.transform(validateemail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email,password, (a, b) => true);
  

  submit() {

    final validEmail = _emailController.value;
    final validpassword = _passwordController.value;

    print('Email is $validEmail &  Password is $validpassword');
  }


  
dispose(){
  _emailController.close();
  _passwordController.close();
}

}
//final blocs = Bloc(); // ** Single global approach
