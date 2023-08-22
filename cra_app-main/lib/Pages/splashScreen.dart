// ignore: file_names
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
          child: Column(
        children: [
          const Text(
            'CRA',
            style: TextStyle(color: Colors.white),
          ),
          LoadingAnimationWidget.newtonCradle(color: Colors.white, size: 200),
        ],
      )),
    );
  }
}
