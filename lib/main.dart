import 'package:flutter/material.dart';
import 'home.dart';
void main() => runApp(MyApp());


TextEditingController _controller = new TextEditingController();


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bobble',
      home: home(),
    );
  }
}