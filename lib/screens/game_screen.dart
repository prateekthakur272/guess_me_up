import 'package:flutter/material.dart';
import 'package:guess_me_up/screens/numpad.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NumPad(onChange: (s) {}),
      ),
    );
  }
}
