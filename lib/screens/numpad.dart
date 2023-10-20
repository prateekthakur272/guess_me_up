import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NumPad extends StatefulWidget {
  final Function(String) onChange;
  const NumPad({super.key, required this.onChange});

  @override
  State<NumPad> createState() => _NumPadState();
}

class _NumPadState extends State<NumPad> {
  String number = '';
  @override
  Widget build(BuildContext context) {
    numPadButton(IconData icon, int value) => Expanded(
            child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ElevatedButton(
            onPressed: () {
              _button(value);
              widget.onChange(number);
            },
            style: const ButtonStyle(
                splashFactory: InkSplash.splashFactory,
                shape: MaterialStatePropertyAll(StadiumBorder()),
                minimumSize:
                    MaterialStatePropertyAll(Size(double.maxFinite, 64))),
            child: Icon(icon),
          ),
        ));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numPadButton(FontAwesomeIcons.one, 1),
            numPadButton(FontAwesomeIcons.two, 2),
            numPadButton(FontAwesomeIcons.three, 3)
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numPadButton(FontAwesomeIcons.four, 4),
            numPadButton(FontAwesomeIcons.five, 5),
            numPadButton(FontAwesomeIcons.six, 6)
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numPadButton(FontAwesomeIcons.seven, 7),
            numPadButton(FontAwesomeIcons.eight, 8),
            numPadButton(FontAwesomeIcons.nine, 9)
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numPadButton(FontAwesomeIcons.xmark, 100),
            numPadButton(FontAwesomeIcons.zero, 0),
            numPadButton(FontAwesomeIcons.arrowLeft, 101)
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                  textStyle: MaterialStatePropertyAll(
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  splashFactory: InkSplash.splashFactory,
                  shape: MaterialStatePropertyAll(StadiumBorder()),
                  minimumSize:
                      MaterialStatePropertyAll(Size(double.maxFinite, 64))),
              child: const Text('Submit')),
        )
      ],
    );
  }

  _button(int input) {
    switch (input) {
      case 100:
        {
          number = '';
        }
      case 101:
        {
          if (number.isNotEmpty) {
            number = number.substring(0, number.length - 1);
          }
        }
      default:
        {
          number += input.toString();
        }
    }
  }
}
