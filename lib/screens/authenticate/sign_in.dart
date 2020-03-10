import 'package:flutter/material.dart';
import '../../services/auth.dart';
import '../../services/auth.dart';

class SignIn extends StatefulWidget {

  Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In',
        ),
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          FlatButton.icon(
            onPressed: widget.toggleView, 
            icon: Icon(Icons.person), 
            label: Text('Sign Up')
          )
        ],
      ),
      backgroundColor: Colors.yellow[100],
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              TextFormField(
                validator: (val) {
                  if (val.isEmpty){
                    return "Enter an e-mail";
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                }
              ),
              SizedBox(height: 20,),
              TextFormField(
                validator : (val) {
                  if (val.length < 3){
                    return "Passwords must have 4 characters";
                  } else {
                    return null;
                  }
                },
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                }
              ),
              SizedBox(height: 20,),
              RaisedButton(
                child: Text('Sign in'),
                color: Colors.pink,
                onPressed: () async {
                  if (_formKey.currentState.validate()){
                    /*dynamic result = await _auth.(email, password);
                    if (result == null) {
                      setState(() {
                        error = "Error registering";
                      });
                    }
                  }*/
                  dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                  if (result == null) {
                    print("error");
                  }
                  print(result);
                  }
                },
              )  
            ],
          )
        )
      ),
    );
  }
}