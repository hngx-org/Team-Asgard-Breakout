// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:ui';

import 'package:game_breakout_task/breakout_game.dart';
import 'package:game_breakout_task/sprites/ball.dart';
import 'package:game_breakout_task/score.dart';
import 'package:game_breakout_task/level.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'dart:async' as dartAsync;
import 'dart:math' as math;

int levelCounter = 0;

class Brick extends PositionComponent
 with HasGameRef<BreakoutGame>, CollisionCallbacks {
 late final RectangleHitbox brickHitBox;
 late final RectangleComponent brick;

  final Size Bsize;
  final Vector2 Bposition;
  final Color Bcolor;

  Brick({
    required this.Bsize,
    required this.Bposition,
    required this.Bcolor,
  });

  var destroy = false;
  get body => null;

  bool hasCollided = false;

  void updatePlayerScore(ScoreText player) {
    player.score += 1;
    dartAsync.Timer(const Duration(seconds: 1), () {
      _resetBall;
    });
  }

  void updatePlayerLevel(LevelText level) {
    level.level += 1;
    dartAsync.Timer(const Duration(seconds: 1), () {
      _resetBall;
    });
  }

    late Vector2 velocity;

    static const double speed = 150;

    static const degree = math.pi / 180;

 
 @override
 FutureOr<void> onLoad() {
  _resetBall;
 
   size = Vector2(56, 10);
   position.y = Bposition.y;
   position.x = Bposition.x/ 1.15 ;
   brick = RectangleComponent(
     size: size,
     paint: Paint()..color = Bcolor,
   );
 
   brickHitBox = RectangleHitbox();
 
   addAll([
    brick,
     brickHitBox,
   ]);
 
 return super.onLoad();
 }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Ball && !hasCollided) {
        hasCollided = true;
        removeFromParent();
        final player = gameRef.player;
        updatePlayerScore(player);
        levelCounter += 1;
        if (levelCounter == 48){
          final level = gameRef.level;
          updatePlayerLevel(level);
          // levelCounter = 0;
        }
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    if (hasCollided) {
      hasCollided = false;
    }
    super.onCollisionEnd(other);
  }

  void get _resetBall {
      position = gameRef.size / 2;
      final spawnAngle = getSpawnAngle;
    
      final vx = math.cos(spawnAngle * degree) * speed;
      final vy = math.sin(spawnAngle * degree) * speed;
        velocity = Vector2(
          vx,
          vy,
        );
    }

    double get getSpawnAngle {
      final sideToThrow = math.Random().nextBool();
      
      final random = math.Random().nextDouble();
      final spawnAngle = sideToThrow ? lerpDouble(45, 90, random)! : lerpDouble(90, 135, random)!;
      
      return spawnAngle;
    }


}