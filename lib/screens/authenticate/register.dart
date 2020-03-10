import 'package:firebase_implementation/shared/const.dart';
import 'package:firebase_implementation/shared/loading.dart';
import 'package:flutter/material.dart';
import '../../services/auth.dart';

class Register extends StatefulWidget {

  Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :  Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
        ),
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          FlatButton.icon(
            onPressed: widget.toggleView, 
            icon: Icon(Icons.person), 
            label: Text('Sign In')
          ),
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
                decoration: textInputDecoration.copyWith(labelText: 'E-mail'),
                validator: (val) {
                  if (val.isEmpty){
                    return "Enter an e-mail";
                  } else if (!val.contains('@')) {
                    return "Enter a valid e-mail";
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
                decoration: textInputDecoration.copyWith(labelText: 'Password'),
                obscureText: true,
                validator : (val) {
                  if (val.length < 5){
                    return "Passwords must have 6 characters";
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                }
              ),
              SizedBox(height: 20,),
              RaisedButton(
                child: Text('Sign up'),
                color: Colors.pink,
                onPressed: () async {
                  if (_formKey.currentState.validate()){
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        loading = false;
                        error = "Error registering";
                      });
                    }
                  }

                  else {
                    print('asd');
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