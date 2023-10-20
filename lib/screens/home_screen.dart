import 'package:flutter/material.dart';
import 'package:guess_me_up/screens/game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Guess ME Up'),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.numbers_rounded,
                color: Colors.green.shade400,
                size: 100,
              ),
              const Text(
                'Guess the number in least time,\nNumber is between 0-100,\nDon\'t worry we are here to help you.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GameScreen()));
                  },
                  child: const Text('Start Game'))
            ],
          ),
        )));
  }
}
