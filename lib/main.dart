import 'package:flutter/material.dart';
import 'package:guess_me_up/screens/home_screen.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess Me Up',
      home: const HomeScreen(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
