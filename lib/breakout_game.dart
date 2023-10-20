import 'package:game_breakout_task/ball.dart';
import 'package:game_breakout_task/brick_wall.dart';
import 'package:game_breakout_task/player_paddle.dart';
import 'package:game_breakout_task/score.dart';
import 'package:game_breakout_task/level.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

double vel = 150;

enum GameState {
 initializing,
 ready,
 running,
 paused,
 won,
 lost,
}

class BreakoutGame extends FlameGame
 with HasCollisionDetection, HasKeyboardHandlerComponents, DoubleTapDetector, TapDetector, HorizontalDragDetector {

  late final ScoreText player;
  late final LevelText level;

  bool running = true;
  late final BrickWall _brickWall;
  BreakoutGame();
 
 
 @override
 Future<void> onLoad() async {

  final brickWallPosition = Vector2(0.0, size.y * 0.075);

    _brickWall = BrickWall(
      position: brickWallPosition,
      rows: 8,
      columns: 6,
    );
    await add(_brickWall);
    
   addAll([
     PlayerPaddle(),
     ScreenHitbox(),
     Ball(),
     player = ScoreText.playerScore(),
     level = LevelText.playerLevel(),
   ]);
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
  @override
  void onHorizontalDragDown(DragDownInfo info) {
    // TODO: implement onHorizontalDragDown
    double eventX = info.eventPosition.global[0];
    double eventY = info.eventPosition.global[1];
    if (eventX > 200 && eventY > 600){
      vel += 70;
    }else if (eventX < 200 && eventY > 600){
      vel -= 70;
    }

    if (eventY < 600){
      if(running){
        pauseEngine();
      } else{
        resumeEngine();
      }
      running = !running;
    }
    
    // return true;
    super.onHorizontalDragDown(info);
  }
}