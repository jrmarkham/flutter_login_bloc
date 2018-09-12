// DEPENDENCIES
import 'package:flutter/material.dart';
// DEV LIBS
import '../blocs/provider.dart';
import '../blocs/blocs.dart';




// create instance in widgets for scoped instances //
// use an inherited instance in Login screen
// final bloc_scoped = Bloc();


class LoginScreen extends StatelessWidget{

  Widget build(context){
    /// SCOPED BLOC
    final bloc_scoped = Provider.of(context);
    return Container(
        margin: EdgeInsets.only(top:50.0, bottom: 25.0, left:25.0, right: 25.0),

        child:Column(
          children: <Widget>[
            // use Texfields not Forms

            emailField(bloc_scoped),
            passwordField(bloc_scoped),
            // USE CONTAIN FOR JUST MARGIN SPACING
            Container(margin: EdgeInsets.only(top: 35.0)),
            submitButton(),
            resetButton()


          ],
        )
    );
  }
}



Widget emailField(Bloc blocScope) {



  return StreamBuilder(
    /// GLOBAL BLOC
    //  stream: bloc_global.email,
    /// SCOPED BLOC
      stream: blocScope.email,
      builder: (context, snapshot) {
        return TextField(
          /// GLOBAL BLOC
          //  onChanged: block_global.changeEmail,
          /// SCOPED BLOC
          onChanged: blocScope.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email Address:',
            hintText: 'you@email.com',
            errorText: snapshot.error,
          ),
        );
      }
  );
}

Widget passwordField(Bloc blocScope) {
  return StreamBuilder(
    /// GLOBAL BLOC
    //  stream: bloc_global.password,
    /// SCOPED BLOC
      stream: blocScope.password,
      builder:(context, snapshot){
        return TextField(
          /// GLOBAL BLOC
          //  onChanged: block_global.changePassword,
          /// SCOPED BLOC
          onChanged: blocScope.changePassword,
          decoration: InputDecoration(
            labelText: 'Password:',
            hintText: 'password',
            errorText: snapshot.error,
          ),
        );
      }
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

