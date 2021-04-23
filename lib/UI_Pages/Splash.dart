import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('Assets/Images/cold_splash.jpg'),
            fit: BoxFit.cover),
      ),
    );
  }
}
