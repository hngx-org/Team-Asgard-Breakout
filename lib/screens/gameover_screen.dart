import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  const GameOver({super.key, required this.isGameOver, required this.score});
  final bool isGameOver;
  final int score;
  @override
  Widget build(BuildContext context) {
    return isGameOver
        ? Container(
            alignment: Alignment(0, -0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("G A M E  O V E R"),
                Text("Scores: $score"),
              ],
            ),
          )
        : Container();
  }
}
