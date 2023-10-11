import 'package:flutter/material.dart';


class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}
enum  direction {UP, DOWN, LEFT, RIGHT,}
class _GamePageState extends State<GamePage> {
  //game started
  bool hasGameStarted = false;
  bool isGameOver = false;
  
  //ball position
  double ballX = 0;
  double ballY = 0;
  double ballXincrease = 0.01;
  double ballYincrease = 0.01;
  
  var ballYDirection = direction.DOWN;
  var ballXDirection = direction.LEFT;
  
  // player Variables
  double playerX = -0.2;
  double playerWidth = 0.4;
  
  //brick variables
  static double firstBrickX = -1+ WG;
  static double firstBrickY = -0.9;
  static double brickWidth = 0.2;
  static double brickHeight = 0.05;
  static double brickGap = 0.3;
  static int noOfBricks = 4;
  static double WG = 0.5*(2-noOfBricks*brickWidth - (noOfBricks-1)*(brickGap));
  // bool brickBroken = false;
  
  List GameBricks = [
    //[x,y, broken =true/false]
    [firstBrickX + 0*(brickWidth+brickGap),firstBrickY, false],
    [firstBrickX+ 1*(brickWidth+ brickGap), firstBrickY,false],
    [firstBrickX+ 2*(brickWidth+ brickGap), firstBrickY,false],
    [firstBrickX+ 3*(brickWidth+ brickGap), firstBrickY,false],
  
  ];
  
  //move left
  void moveLeft() {
    setState(() {
      if (!(playerX - 0.2 < -1)) {
        playerX -= 0.2;
      }
    });
  }
  
  // moveRight
  void moveRight() {
    setState(() {
      if (!(playerX + playerWidth>= 1)) {
        playerX += 0.2;
      }
    });
  }
  
  //start game function
  void startGame() {
    hasGameStarted = true;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      moveBall();
      updateBallDirection();
  
      //if playerDead
      if (isPlayerDead()) {
        timer.cancel();
        isGameOver = true;
      }
  
      //check if brick is broken
      checkBrokenBrick();
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
