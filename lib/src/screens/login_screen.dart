// DEPENDENCIES
import 'package:flutter/material.dart';
// DEV LIBS
import '../blocs/blocs.dart';

class LoginScreen extends StatelessWidget{
  Widget build(context){
    return Container(
      margin: EdgeInsets.only(top:50.0, bottom: 25.0, left:25.0, right: 25.0),

      child:Column(
        children: <Widget>[
          // use Texfields not Forms

          emailField(),
          passwordField(),
          // USE CONTAIN FOR JUST MARGIN SPACING
          Container(margin: EdgeInsets.only(top: 35.0)),
          submitButton(),
          resetButton()


        ],
      )
    );
  }
}



Widget emailField() {
  return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Email Address:',
          hintText: 'you@email.com',
          errorText: bloc.emailError
      ),
    onChanged: (newValue){
        bloc.changeEmail(newValue);

    },


  );
}

Widget passwordField() {
  return TextField(
    // off for testing
    // obscureText: true,
    decoration: InputDecoration(
      labelText: 'Password:',
      hintText: 'Password',
      errorText: 'Not a valid password'
    ),
    onChanged:(event){

    },
  );
}

Widget submitButton() {
  return RaisedButton(
    onPressed: () {
      print('sumit');
    },
    color: Colors.blue,
    child: Text('Submit'),
  );
}

Widget resetButton() {
  return RaisedButton(
    onPressed: () {
      print('reset');
    },
    color: Colors.green,
    child: Text('Reset'),
  );
}

