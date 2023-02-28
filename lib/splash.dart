import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.call,
                size: 50,
              ),
            ),
            CircularProgressIndicator(),
            Text(
              "Made in  Flutter",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
