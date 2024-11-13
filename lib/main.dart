import 'package:bloodmotivation/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const myapp());
}
class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}

