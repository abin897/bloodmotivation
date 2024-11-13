import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
        return PageViewExample();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFFFFAF5),
      body: Center(
          child:Image.asset("assets/images/CARING.png",width: 400,height: 400, )
        // Solid text as fill.

      ),
    );
  }
}

