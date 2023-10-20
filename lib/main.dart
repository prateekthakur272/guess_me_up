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
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.green.shade400,
              onPrimary: Colors.black,
              secondary: Colors.black,
              onSecondary: Colors.white,
              error: Colors.red.shade300,
              onError: Colors.white,
              background: Colors.white,
              onBackground: Colors.black,
              surface: Colors.white,
              onSurface: Colors.black),
          appBarTheme: const AppBarTheme(
              foregroundColor: Colors.black,
              titleTextStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.green.shade400)))),
    );
  }
}
