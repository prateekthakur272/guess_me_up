import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guess_me_up/game.dart';
import 'package:guess_me_up/screens/numpad.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String display = '0';
  late Game game;
  String message = 'Secret number has been generated,\nfind it quickly.';

  @override
  void initState() {
    game = Game();
    game.startGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      display,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.green.shade500,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              // const Divider(),
              NumPad(
                onChange: (s) {
                  setState(() {
                    display = s.toString();
                  });
                },
                onSubmit: (s) {
                  setState(() {
                    message = game.getHints(s);
                  });
                  if (game.check(s)) {
                    showDialog(
                        context: context,
                        builder: ((context) => Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.trophy,
                                      size: 100,
                                      color: Colors.green.shade400,
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    const Text(
                                      'congratulations, Your number was correct',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Total guess: ${game.attempts}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FilledButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.red.shade300)),
                                            onPressed: () {
                                              Navigator.popUntil(context,
                                                  (route) => route.isFirst);
                                            },
                                            child: const Text('Quit')),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        FilledButton(
                                            onPressed: () {
                                              setState(() {
                                                game.finish();
                                                game = Game();
                                                game.startGame();
                                                message =
                                                    'Secret number has been generated,\nfind it quickly.';
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Play Again'))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )));
                  }
                },
              ),
              const SizedBox(
                height: 64,
              )
            ],
          ),
        ),
      ),
    );
  }
}
