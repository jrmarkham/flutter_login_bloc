// DEPENDENCIES
import 'package:flutter/material.dart';
// DEV LIBS
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin{
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  Widget build(context) {
    return Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              emailField(),
              passwordField(),
              // USE CONTAIN FOR JUST MARGIN SPACING
              Container(margin: EdgeInsets.only(top: 35.0)),
              submitButton(),
              resetButton()
            ],
          ),
        ));
  }

  Widget emailField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: 'Email Address:', hintText: 'you@email.com'),
        validator: validateEmail,
        onSaved: (String val) {
          email = val;
          print('saved $val');
        });
  }

  Widget passwordField() {
    return TextFormField(
      //    off for testing
      //    obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password:',
        hintText: 'Password',
      ),
      validator: validatePassword,
      onSaved: (String val) {
        password = val;
        print('saved $val');
      },
    );
  }

  Widget resetButton() {
    return RaisedButton(
      onPressed: () {
        formKey.currentState.reset();
        print('reset');
      },
      color: Colors.green,
      child: Text('Reset'),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Time to post $email and $password to my api.');
        }
      },
      color: Colors.blue,
      child: Text('Submit'),
    );
  }
}
