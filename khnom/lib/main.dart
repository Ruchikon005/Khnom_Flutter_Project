import 'package:flutter/material.dart';
import 'package:khnom/screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'khnom',
      home: Home(),
    );
  }
}
