import 'package:flutter/material.dart';

class GameBall extends StatelessWidget {
  const GameBall({super.key, this.ballX, this.ballY});
  final ballX;
  final ballY;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(ballX, ballY),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        height: 15,
        width: 15,
      ),
    );
  }
}
