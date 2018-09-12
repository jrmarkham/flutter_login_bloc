// DEPENDENCIES
import 'dart:async';
// DEV LIBS


class Bloc{
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  // Add data to stream
  Stream<String> get email => _emailController.stream;
  Stream<String> get password => _passwordController.stream;

  // Change data from Stream (add sink)
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Transformers


}