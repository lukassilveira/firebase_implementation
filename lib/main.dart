import 'package:firebase_implementation/models/user.dart';
import 'package:firebase_implementation/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().stream,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}