import 'package:flutter/material.dart';

class PlayerBar extends StatelessWidget {
  const PlayerBar({super.key, this.playerX, this.playerWidth});

  final playerX;
  final playerWidth; //out of 2

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment:
            Alignment((2 * playerX + playerWidth) / (2 - playerWidth), 0.95),
        child: Container(
          height: 10,
          width: MediaQuery.of(context).size.width * playerWidth / 2,
          color: Colors.black,
        ),
      ),
    );
  }
}
