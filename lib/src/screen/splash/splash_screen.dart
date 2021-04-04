import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/screen/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(HomeScreen.createRoute());
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurpleAccent,
                Colors.deepPurple,
              ]),
        ),
        child: Center(
          child: Text(
            "MovieApp",
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
