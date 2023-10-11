import 'dart:async';

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
  void checkBrokenBrick() {
    for(int brick =0;brick < GameBricks.length; brick++ ){
      if (ballX >= GameBricks[brick][0] &&
          ballX <= GameBricks[brick][0] + brickWidth &&
          ballY <= GameBricks[brick][1] + brickHeight &&
          GameBricks[brick][2] == false) {
        setState(() {
          GameBricks[brick][2] = true;
          ballYDirection = direction.DOWN;
        });
      }
    }
  }

  bool isPlayerDead() {
    if (ballY >= 1) {
      return true;
    }
    return false;
  }

  void moveBall() {
    setState(() {
      //move horizontally
      if (ballXDirection == direction.LEFT) {
        ballX -= ballXincrease;
      } else if (ballXDirection == direction.RIGHT) {
        ballX += ballXincrease;
      }
      //move vertically
      if (ballYDirection == direction.DOWN) {
        ballY += ballYincrease;
      } else if (ballYDirection == direction.UP) {
        ballY -= ballXincrease;
      }
    });
  }

  void updateBallDirection() {
    setState(() {
      // ball when it hit player bar
      if (ballY >= 0.9 && ballX >= playerX && ballX <= playerX + playerWidth) {
        ballYDirection = direction.UP;
      }
      // bal when it hits top of the screen
      else if (ballY <= -1 ) {
        ballYDirection = direction.DOWN;
      }
      //ball goes right when it hits left wall
      if(ballX<=-1){
        ballXDirection = direction.RIGHT;
      }
      // ball goes left when it hits right wall
      else if(ballX>=1){
        ballXDirection = direction.LEFT;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
