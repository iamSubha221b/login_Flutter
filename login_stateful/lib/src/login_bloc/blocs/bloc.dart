import 'dart:async';
import 'validators.dart';

class Bloc extends Object with Validators
{
  final  _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();



  // change data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // retrieve stream
   get email => _emailController.stream.transform(validateemail);
  Stream<String> get Password => _passwordController.stream.transform(validatePassword);

dispose(){
  _emailController.close();
  _passwordController.close();

}

}
//final blocs = Bloc(); // ** Single global approach
