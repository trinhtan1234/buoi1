import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.blue,
              ],
              stops: [
                0.0,
                1.0
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              tileMode: TileMode.repeated),
        ),
        child: Column(children: [
          Row(
            children: [
              Image.network(
                  'https://photos.google.com/photo/AF1QipNRJfc7g4i3vOCov0XfEE0DWowmr9eAR66LNETJ'),
            ],
          ),
        ]),
      ),
    ));
  }
}
