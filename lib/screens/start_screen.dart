import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(
      {super.key, required this.hasGameStarted, required this.startGame});
  final bool hasGameStarted;
  final Function() startGame;

  @override
  Widget build(BuildContext context) {
    return hasGameStarted
        ? Container()
        : Container(
            alignment: Alignment(0, -0.2),
            child: GestureDetector(
                onTap: startGame,
                child: Text(
                  "Tap to play",
                  style: TextStyle(fontSize: 24),
                )),
          );
  }
}
