// DEPENDENCIES
import 'dart:async';
// DEV LIBS
import 'validators.dart';

class Bloc extends Object with Validators{
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  // add transformations to stream getters
  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  // Change data from Stream (add sink)
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // close sinks
  dispose(){
    _email.close();
    _password.close();
  }
}
// SINGLE GLOBAL INSTANCE
// one instance of the bloc for entire app
// final bloc_global = Bloc();

// create instance in widgets for scoped instances //