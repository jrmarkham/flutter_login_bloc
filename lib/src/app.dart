// DEPENDENCIES
import 'package:flutter/material.dart';
// DEV LIBS
import 'screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  Widget build(context) {
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