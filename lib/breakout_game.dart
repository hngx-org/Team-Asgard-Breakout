import 'package:game_breakout_task/sprites/ball.dart';
import 'package:game_breakout_task/sprites/brick.dart';
import 'package:game_breakout_task/sprites/brick_wall.dart';
import 'package:game_breakout_task/sprites/player_paddle.dart';
import 'package:game_breakout_task/score.dart';
import 'package:game_breakout_task/level.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
// import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'sprites/testBrick.dart';
import 'world.dart';

// double vel = 150;

enum GameState {
  initializing,
  ready,
  running,
  paused,
  won,
  lost,
}

class BreakoutGame extends FlameGame with HasCollisionDetection {
  final WorldX _world = WorldX();

  late final ScoreText player;
  late final LevelText level;

  // // bool running = true;
  late BrickWall _brickWall;
  // // BreakoutGame();
  late PlayerPaddle paddle;
  late Ball ball;
  late List<TestBrick> bricks;

  // @override
  // void pauseGame() {
  //   pauseEngine();
  // }
  //
  // void resumeGame() {
  //   resumeEngine();
  // }
  //
  void setBall() {
    Vector2 ballSize = Vector2.all(20);
    Vector2 ballPosition = size / 2 - ballSize / 2;
    Vector2 initialVelocity = Vector2(0, 25);
    Vector2 maxVelocity = Vector2(25, 50);
    Vector2 gravity = Vector2(0, 0.2);

    ball = Ball(
      ballSize: ballSize,
      ballPosition: ballPosition,
      initialVelocity: initialVelocity,
      maxVelocity: maxVelocity,
      gravity: gravity,
    );
    ball.velocity = Vector2(0, 50);
    add(ball);
  }

  void setPlayer() {
    Vector2 paddleSize = Vector2(100, 25);
    Vector2 paddlePosition =
        Vector2(size.x / 2 - paddleSize.x / 2, size.y * 0.9);
    paddle = PlayerPaddle(
      paddleSize: paddleSize,
      paddlePosition: paddlePosition,
    );
    add(paddle);
  }

  //
  void initializeGame() {
    add(player = ScoreText.playerScore());
    add(level = LevelText.playerLevel());
    setBall();
    setPlayer();
    setBricks();
    // setTestBricks(7);
  }
  void setTestBricks(int numBricks){
    const int n =6;
    double xSpace = 10;
    double ySpace = 2;
    double brickWidth = (size.x - ((n + 1) * xSpace)) / n;
    double brickHeight = brickWidth/2;
    Vector2 brickSize = Vector2(brickWidth, brickHeight);
    // Vector2 brickPosition = Vector2(size.x * 0.1, size.y * 0.1);
    double xPos =2;
    double yPos =75;
    bricks = [];
    for (var brickIndex = 0; brickIndex < numBricks; brickIndex++) {
      bricks.add(
        TestBrick(
          brickSize: brickSize,
          brickPosition: Vector2(xPos,yPos),
        ),
      );
      xPos += brickSize.x +xSpace;
      if(xPos + brickSize.y > size.x){
        yPos += brickSize.y + ySpace;
        xPos =2;
      }
    }
    addAll(bricks);

  }
  void setBricks() {
    final brickWallPosition = Vector2(0.0, size.y * 0.075);

    _brickWall = BrickWall(
      position: brickWallPosition,
      rows: 8,
      columns: 6,
    );
    add(_brickWall);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    initializeGame();
    await add(_world);
    //
    //
    //   // addAll([
    //   //   // PlayerPaddle(),
    //   //   ScreenHitbox(),
    //   //   // Ball(),
    //   //   player = ScoreText.playerScore(),
    //   //   level = LevelText.playerLevel(),
    //   // ]);

    //   setPlayer();
  }

  // @override
  // bool onTapUp(TapUpInfo info) {
  //   double eventX = info.eventPosition.global[0];
  //   double eventY = info.eventPosition.global[1];
  //   if (eventX > 200 && eventY > 600){
  //     vel += 70;
  //   }else if (eventX < 200 && eventY > 600){
  //     vel -= 70;
  //   }

  //   if (eventY < 600){
  //     if(running){
  //       pauseEngine();
  //     } else{
  //       resumeEngine();
  //     }
  //     running = !running;
  //   }

  //   return true;
  // }
  // @override
  // void onHorizontalDragDown(DragDownInfo info) {
  //   // TODO: implement onHorizontalDragDown
  //   double eventX = info.eventPosition.global[0];
  //   double eventY = info.eventPosition.global[1];
  //   if (eventX > 200 && eventY > 600){
  //     vel += 70;
  //   }else if (eventX < 200 && eventY > 600){
  //     vel -= 70;
  //   }
  //
  //   if (eventY < 600){
  //     if(running){
  //       pauseEngine();
  //     } else{
  //       resumeEngine();
  //     }
  //     running = !running;
  //   }
  //
  //   // return true;
  //   super.onHorizontalDragDown(info);
  // }

  void pauseGame(){
    pauseEngine();
  }

@override
  Future update(dt)async {
    super.update(dt);
    if(levelCounter >=48){
      pauseEngine();
    }
}
}
