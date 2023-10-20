import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guess_me_up/screens/numpad.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String display = '000';
  Timer timer = Timer(Duration.zero, () {});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Secret number has been generated,\nfind it.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  display = s;
                });
              },
              onSubmit: (s) {},
            ),
            const SizedBox(
              height: 64,
            )
          ],
        ),
      ),
    );
  }
}
