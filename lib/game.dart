import 'dart:math';

class Game {
  int _number = 0;
  int attempts = 0;
  Game();

  startGame() {
    _number = Random().nextInt(101);
  }

  bool check(int guess) {
    attempts++;
    return _number == guess;
  }

  String getHints(int guess) {
    if (_number < guess) {
      return 'Your number was large, try something small';
    } else if (_number > guess) {
      return 'Your number was small, try something large';
    }
    return 'You guessed it right';
  }

  finish() {
    _number = 0;
    attempts = 0;
  }
}
