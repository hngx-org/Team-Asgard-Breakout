import 'package:flutter/material.dart';

class Brick extends StatelessWidget {
  const Brick({
    super.key,
    required this.brickHeight,
    required this.brickWidth,
    required this.brickX,
    required this.brickY,
    required this.brickBroken,
  });
  final double brickX;
  final double brickY;
  final double brickHeight;
  final double brickWidth;
  final bool brickBroken;

  @override
  Widget build(BuildContext context) {
    return brickBroken
        ? Container()
        : Container(
            alignment:
                Alignment((2 * brickX + brickWidth) / (2 - brickWidth), brickY),
            child: Container(
              color: Colors.black,
              height: 35,
              width: MediaQuery.of(context).size.height * brickWidth / 2,
            ),
          );
  }
}
