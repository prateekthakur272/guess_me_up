import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guess_me_up/game.dart';
import 'package:guess_me_up/screens/numpad.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String display = '0';
  late Game game;
  String message = 'Secret number has been generated,\nfind it quickly.';
  late Timer timer;
  int countDown = 90;

  @override
  void initState() {
    game = Game();
    game.startGame();
    timer = startTimer();
    super.initState();
  }

  Timer startTimer() {
    return Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        if (countDown > 0) {
          countDown--;
        } else {
          game.finish();
          t.cancel();
          showDialog(
              context: context,
              builder: ((context) => Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Icon(
                          FontAwesomeIcons.clock,
                          size: 100,
                          color: Colors.green.shade400,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Game Over',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'None of your guess was correct',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
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
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FilledButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.red.shade300)),
                                onPressed: () {
                                  Navigator.popUntil(
                                      context, (route) => route.isFirst);
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
                                    countDown = 90;
                                    timer = startTimer();
                                    message =
                                        'Secret number has been generated,\nfind it quickly.';
                                  });
                                  Navigator.pop(context);
                                },
                                child: const Text('Play Again'))
                          ],
                        )
                      ]),
                    ),
                  )));
        }
      });
    });
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
                padding: const EdgeInsets.all(8.0),
                child: CircularPercentIndicator(
                  radius: 56,
                  percent: (countDown / 90),
                  lineWidth: 12,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    countDown.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 44, fontWeight: FontWeight.bold),
                  ),
                  progressColor: countDown > 15
                      ? Colors.green.shade400
                      : Colors.red.shade300,
                ),
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
                    timer.cancel();
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
                                                countDown = 90;
                                                timer = startTimer();
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
