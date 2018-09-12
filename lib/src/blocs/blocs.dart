// DEPENDENCIES
import 'dart:async';
import 'package:rxdart/rxdart.dart';
// DEV LIBS
import 'validators.dart';

class Bloc extends Object with Validators{
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // add transformations to stream getters
  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  // RX
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e,p)=>true);


  // Change data from Stream (add sink)
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;


  submit(){
    final String validEmail = _email.value;
    final String validPassword = _password.value;

    print(' submitting email:$validEmail and password: $validPassword');

  }
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