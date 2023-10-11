import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  const GameOver({super.key, required this.isGameOver});
  final bool isGameOver;
  @override
  Widget build(BuildContext context) {
    return isGameOver
        ? Container(
            alignment: Alignment(0, -0.5),
            child: Text("G A M E  O V E R"),
          )
        : Container();
  }
}
