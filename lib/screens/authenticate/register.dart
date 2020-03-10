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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                validator: (val) {
                  if (val.isEmpty){
                    return "Enter an e-mail";
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  setState(() {
                  });
                }
              ),
              SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                validator : (val) {
                  if (val.length < 3){
                    return "Passwords must have 4 characters";
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  setState(() {
                  });
                }
              ),
              SizedBox(height: 20,),
              RaisedButton(
                child: Text('Sign up'),
                color: Colors.pink,
                onPressed: () async {
                  if (_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if (result== null) {
                      setState(() {
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