import 'package:flutter/material.dart';
import '../../services/auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final AuthService _auth = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Party'),
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.person), 
            label: Text('Sign Out'),
          )
        ],
      ),
      backgroundColor: Colors.yellow[100],
    );
  }
}