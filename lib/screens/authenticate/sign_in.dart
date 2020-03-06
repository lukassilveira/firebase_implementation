import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In',
        ),
        backgroundColor: Colors.brown[400],
      ),
      backgroundColor: Colors.yellow[100],
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: RaisedButton(
          onPressed: () async {

          },
          child: Text(
            'Sign In',
          ),
          color: Colors.brown[200],
          elevation: 5,
        ),
      ),
    );
  }
}